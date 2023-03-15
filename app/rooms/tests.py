import logging
import random
import string

import pytest
from django.apps import apps
from django.db.models import Q
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APIClient
from rooms.models import Room

logger = logging.getLogger(__name__)


def _get_random_item_of_class(model_class_name):
    model = apps.get_model("rooms", model_class_name)
    if hasattr(model, 'rooms'):
        pks = model.objects.exclude(rooms=None).values_list("pk", flat=True)
    else:
        pks = model.objects.values_list("pk", flat=True)
    random_pk = random.choice(pks)
    instance = model.objects.get(pk=random_pk)
    return instance


@pytest.mark.django_db
@pytest.mark.parametrize(
    "room_model", ["RoomsRelatedObjectsMaterializedView", "RoomWithRelatedObjsRebuildInApp", "RoomWithRelatedObjsV3"]
)
def test_door_change_reflected_in_its_rooms(room_model):
    """
    Every room has one door type (ForeignKey). 
    Every Door (door type) may be installed in many rooms.
    Ensure that Door (door type) changes are reflected in all its rooms.
    """
    # NOTE Door model is about door types, not door instances

    door_instance = _get_random_item_of_class('Door')
    model = apps.get_model("rooms", room_model)

    # check before name change, just in case
    for room in door_instance.rooms.all():
        room_model_instance = model.objects.get(pk=room.id)
        assert door_instance.name == room_model_instance.door["name"]
    
    # change door type's name
    letters = string.ascii_letters
    door_instance.name = "".join(random.choice(letters) for i in range(10))
    door_instance.save()
    
    # check after change
    for room in door_instance.rooms.all():
        room_model_instance = model.objects.get(pk=room.id)
        room_model_instance.refresh_from_db()
        assert room_model_instance.door["name"] == door_instance.name


def _search_fitting_in_room_view_or_v2(fitting_id, room_with_related_data):
    found_fitting = False
    fitting_name = None
    # Rooms -> Windows -> Fittings
    for window in room_with_related_data.windows:
        if found_fitting:
            break
        for fitting in window["fittings"]:
            if not fitting:
                break
            if fitting["id"] == fitting_id:
                found_fitting = True
                fitting_name = fitting["name"]
                break
    return found_fitting, fitting_name


@pytest.mark.django_db
@pytest.mark.parametrize(
    "room_model", ["RoomsRelatedObjectsMaterializedView", "RoomWithRelatedObjsRebuildInApp", "RoomWithRelatedObjsV3"]
)
def test_window_fitting_change_reflected_in_its_rooms(room_model):
    """
    Rooms are related with WindowFittings through Windows.
    Ensure that window fitting change is reflected in all its rooms.
    """
    # NOTE fittings have several windows, every window has one room

    # get random window fitting and change it
    fitting = _get_random_item_of_class("WindowFittings")
    model = apps.get_model("rooms", room_model)
    letters = string.ascii_letters
    new_wf_name = "".join(random.choice(letters) for i in range(10))
    fitting.name = new_wf_name
    fitting.save()
    
    # get all rooms of the changed Window Fitting through its windows.
    rooms_set = set()
    for window in fitting.windows.all():
        rooms_set.add(window.room)
        
    for room in rooms_set:
        room_model_instance = model.objects.get(pk=room.id)
        found_fitting_in_view, found_name_view = _search_fitting_in_room_view_or_v2(fitting.id, room_model_instance)
        assert found_fitting_in_view
        assert found_name_view == new_wf_name


@pytest.mark.django_db
@pytest.mark.parametrize(
    "room_model", ["RoomsRelatedObjectsMaterializedView", "RoomWithRelatedObjsRebuildInApp", "RoomWithRelatedObjsV3"]
)
def test_room_change_reflected_in_its_related_models(room_model):
    """
    Rooms have many related objects. Often, users need to get detailed information about a room 
    and the properties of its associated objects. 
    
    To avoid executing slow and heavy JOIN queries, their results are prepared in advance 
    and stored in RoomsRelatedObjectsMaterializedView, RoomWithRelatedObjsRebuildInApp, and RoomWithRelatedObjsV3.

    Ensure that when we change the Room instance, these changes are reflected 
    in PostgreSQL materialized view, solutions V2 (signals) and V3 (triggers).
    """
    room = _get_random_item_of_class("Room")
    model = apps.get_model("rooms", room_model)
    room_model_instance = model.objects.get(pk=room.id)
    
    # check before name change, just in case
    assert room.name == room_model_instance.name
    
    letters = string.ascii_letters
    new_room_name = "".join(random.choice(letters) for i in range(10))
    room.name = new_room_name
    room.save()
    
    room_model_instance.refresh_from_db()
    assert room.name == room_model_instance.name == new_room_name


def _check_item_in_room_view_and_v2(item_id, furniture_class_name, room_model_obj):
    if furniture_class_name == "Bed":
        furniture_in_room = room_model_obj.beds
    if furniture_class_name == "Chair":
        furniture_in_room = room_model_obj.chairs
    if furniture_class_name == "Table":
        furniture_in_room = room_model_obj.tables
    item_in_room_model_object_found = False
    if len(furniture_in_room) == 0:
        return item_in_room_model_object_found
    for elem in furniture_in_room:
        if elem["id"] == item_id:
            item_in_room_model_object_found = True
    return item_in_room_model_object_found


@pytest.mark.django_db
@pytest.mark.parametrize("furniture_class", ["Bed", "Chair", "Table"])
@pytest.mark.parametrize(
    "room_model", ["RoomsRelatedObjectsMaterializedView", "RoomWithRelatedObjsRebuildInApp", "RoomWithRelatedObjsV3"]
)
def test_furniture_rooms_set_remove_reflected(furniture_class, room_model):
    """
    The Bed, Chair, Table models are about furniture types, not instances.
    Each type of furniture can be placed in one or more rooms.
    Ensure that removing a type of furniture from a room works as expected.
    It should be reflected not only in Room,
    but also in PostgreSQL materialized view, solutions V2 (signals) and V3 (triggers).
    """
    item = _get_random_item_of_class(furniture_class)
    model = apps.get_model("rooms", room_model)
    room = item.rooms.first()
    room_model_instance = model.objects.get(pk=room.id)
    item_in_room_instance_found = _check_item_in_room_view_and_v2(item.id, furniture_class, room_model_instance)
    
    # check before furniture type removal from set, just in case
    assert item_in_room_instance_found
    
    item.rooms.remove(room)
    room_model_instance.refresh_from_db()
    item_in_room_instance_found = _check_item_in_room_view_and_v2(item.id, furniture_class, room_model_instance)
    assert not item_in_room_instance_found


@pytest.mark.django_db
@pytest.mark.parametrize("furniture_class", ["Bed", "Chair", "Table"])
@pytest.mark.parametrize(
    "room_model", ["RoomsRelatedObjectsMaterializedView", "RoomWithRelatedObjsRebuildInApp", "RoomWithRelatedObjsV3"]
)
def test_furniture_rooms_set_add_reflected(furniture_class, room_model):
    """
    The Bed, Chair, Table models are about furniture types, not instances.
    Each type of furniture can be placed in one or more rooms.
    Ensure that adding a type of furniture to the room works as expected.
    It should be reflected not only in Room,
    but also in PostgreSQL materialized view, solutions V2 (signals) and V3 (triggers).
    """
    # Get random Bed, Chair, or Table as well as a room that does NOT have this type of furniture.
    item = _get_random_item_of_class(furniture_class)    
    pks = Room.objects.filter(~Q(id__in=[o.id for o in item.rooms.all()])).values_list("pk", flat=True)
    random_pk = random.choice(pks)
    room = Room.objects.get(pk=random_pk)
    
    model = apps.get_model("rooms", room_model)
    room_model_instance = model.objects.get(pk=room.id)
    # check before item addition to the set of the room's furniture, just in case
    item_in_room_instance_found = _check_item_in_room_view_and_v2(item.id, furniture_class, room_model_instance)
    assert not item_in_room_instance_found  
    
    item.rooms.add(room)
    room_model_instance.refresh_from_db()
    item_in_room_instance_found = _check_item_in_room_view_and_v2(item.id, furniture_class, room_model_instance)
    assert item_in_room_instance_found


@pytest.mark.django_db
@pytest.mark.parametrize(
    "model_name,model_url",
    [
        ("Door", "doors"),
        ("Room", "rooms_native"),
        ("Window", "windows"),
        ("WindowFittings", "window_fittings"),
        ("Chair", "chairs"),
        ("Bed", "beds"),
        ("Table", "tables"),
    ],
)
def test_common_info_models_api_get(model_name, model_url):
    """
    Furniture types have their own URLs where you can get information about them. 
    Ensure that the GET requests work as expected.
    """
    client = APIClient()
    item = _get_random_item_of_class(model_name)
    url = reverse(model_url + "-list") + str(item.pk) + "/"
    response = client.get(url, format="json")
    assert response.status_code == status.HTTP_200_OK
    assert response.data["name"] == item.name
    assert "width" in response.data.keys()
    assert "length" in response.data.keys()
    assert "height" in response.data.keys()


@pytest.mark.django_db
@pytest.mark.parametrize(
    "room_model_name,room_model_url",
    [
        ("RoomsRelatedObjectsMaterializedView", "rooms_mat_view"),
        ("RoomWithRelatedObjsRebuildInApp", "rooms_v2"),
        ("RoomWithRelatedObjsV3", "rooms_v3"),
    ],
)
def test_window_fittings_change_reflected_in_all_room_models(room_model_name, room_model_url):
    """
    Modify the name of the WindowFittings instance using PATCH call
    to its API URL. Ensure this change is reflected in related rooms -
    PostgreSQL materialized view, solutions V2 (signals) and V3 (triggers).
    Obtain the data for checks using GET calls to the URLs of the room models.
    """

    # arrange
    wf = _get_random_item_of_class("WindowFittings")
    window = wf.windows.first()
    room = window.room
    room_model = apps.get_model("rooms", room_model_name)
    room_instance = room_model.objects.get(pk=room.pk)
    url_for_patch_request = reverse("window_fittings-list") + str(wf.pk) + "/"
    letters = string.ascii_letters
    new_wf_name = "".join(random.choice(letters) for i in range(10))
    data = {"name": new_wf_name}
    client = APIClient()

    # act
    response = client.patch(url_for_patch_request, data=data, format="json")
    room_instance.refresh_from_db()

    # assertions
    url_for_get_request = reverse(room_model_url + "-list") + str(room.pk) + "/"
    response = client.get(url_for_get_request, format="json")
    assert response.status_code == status.HTTP_200_OK
    window_filtered = [obj for obj in response.data["windows"] if obj["id"] == window.pk]
    wf_filtered = [obj for obj in window_filtered[0]["fittings"] if obj["id"] == wf.pk]
    wf_name_obtained = wf_filtered[0]["name"]
    assert wf_name_obtained == new_wf_name


@pytest.mark.django_db
@pytest.mark.parametrize(
    "room_model_name,room_model_url",
    [
        ("RoomsRelatedObjectsMaterializedView", "rooms_mat_view"),
        ("RoomWithRelatedObjsRebuildInApp", "rooms_v2"),
        ("RoomWithRelatedObjsV3", "rooms_v3"),
    ],
)
@pytest.mark.parametrize(
    "furniture_model_name,furniture_model_url,furniture_related_name",
    [
        ("Chair", "chairs", "chairs"),
        ("Bed", "beds", "beds"),
        ("Table", "tables", "tables"),
    ],
)
def test_furniture_change_reflected_in_all_room_models(
    room_model_name, room_model_url, furniture_model_name, furniture_model_url, furniture_related_name
):
    """
    Modify the name of the furniture instance using PATCH call
    to its API URL. Ensure this change is reflected in related rooms -
    PostgreSQL materialized view, solutions V2 (signals) and V3 (triggers).
    Obtain the data for checks using GET calls to the URLs of the room models.
    """

    # arrange
    furniture_item = _get_random_item_of_class(furniture_model_name)
    room = furniture_item.rooms.first()
    room_model = apps.get_model("rooms", room_model_name)
    room_instance = room_model.objects.get(pk=room.pk)
    url_for_patch_request = reverse(furniture_model_url + "-list") + str(furniture_item.pk) + "/"
    letters = string.ascii_letters
    new_furniture_name = "".join(random.choice(letters) for i in range(10))
    data = {"name": new_furniture_name}
    client = APIClient()

    # act
    response = client.patch(url_for_patch_request, data=data, format="json")
    room_instance.refresh_from_db()

    # assertions
    url_for_get_request = reverse(room_model_url + "-list") + str(room.pk) + "/"
    response = client.get(url_for_get_request, format="json")
    assert response.status_code == status.HTTP_200_OK
    furniture_filtered = [obj for obj in response.data[furniture_related_name] if obj["id"] == furniture_item.pk]
    furniture_name_obtained = furniture_filtered[0]["name"]
    assert furniture_name_obtained == new_furniture_name
