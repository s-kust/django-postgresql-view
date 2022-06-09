import logging
import random
import string

import pytest
from django.apps import apps
from django.db.models import Q
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APIClient

from rooms.models import Door, Room

logger = logging.getLogger(__name__)


def _get_random_item_of_class(model_class_name):
    model = apps.get_model("rooms", model_class_name)
    pks = model.objects.values_list("pk", flat=True)
    random_pk = random.choice(pks)
    instance = model.objects.get(pk=random_pk)
    return instance


@pytest.mark.django_db
@pytest.mark.parametrize("room_model", ["RoomsRelatedObjectsMaterializedView", "RoomWithRelatedObjsRebuildInApp"])
def test_door_change_reflected_in_its_rooms(room_model):
    pks = Door.objects.exclude(rooms=None).values_list("pk", flat=True)
    random_pk = random.choice(pks)
    door_instance = Door.objects.get(pk=random_pk)
    letters = string.ascii_letters
    model = apps.get_model("rooms", room_model)
    for room in door_instance.rooms.all():
        room_model_instance = model.objects.get(pk=room.id)
        # before name change, just in case
        assert door_instance.name == room_model_instance.door["name"]
    door_instance.name = "".join(random.choice(letters) for i in range(10))
    door_instance.save()
    for room in door_instance.rooms.all():
        room_model_instance = model.objects.get(pk=room.id)
        room_model_instance.refresh_from_db()
        # after name change
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
@pytest.mark.parametrize("room_model", ["RoomsRelatedObjectsMaterializedView", "RoomWithRelatedObjsRebuildInApp"])
def test_window_fitting_change_reflected_in_its_rooms(room_model):
    # fittings have several windows,
    # every window has one room
    fitting = _get_random_item_of_class("WindowFittings")
    model = apps.get_model("rooms", room_model)
    letters = string.ascii_letters
    new_wf_name = "".join(random.choice(letters) for i in range(10))
    fitting.name = new_wf_name
    fitting.save()
    rooms_set = set()
    for window in fitting.windows.all():
        rooms_set.add(window.room)
    for room in rooms_set:
        room_model_instance = model.objects.get(pk=room.id)
        found_fitting_in_view, found_name_view = _search_fitting_in_room_view_or_v2(fitting.id, room_model_instance)
        assert found_fitting_in_view
        assert found_name_view == new_wf_name


@pytest.mark.django_db
@pytest.mark.parametrize("room_model", ["RoomsRelatedObjectsMaterializedView", "RoomWithRelatedObjsRebuildInApp"])
def test_room_change_reflected_in_its_related_models(room_model):
    letters = string.ascii_letters
    room = _get_random_item_of_class("Room")
    model = apps.get_model("rooms", room_model)
    room_model_instance = model.objects.get(pk=room.id)
    # before name change, just in case
    assert room.name == room_model_instance.name
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
@pytest.mark.parametrize("room_model", ["RoomsRelatedObjectsMaterializedView", "RoomWithRelatedObjsRebuildInApp"])
def test_furniture_rooms_set_remove_reflected(furniture_class, room_model):
    item = _get_random_item_of_class(furniture_class)
    model = apps.get_model("rooms", room_model)
    room = item.rooms.first()
    room_model_instance = model.objects.get(pk=room.id)
    item_in_room_instance_found = _check_item_in_room_view_and_v2(item.id, furniture_class, room_model_instance)
    # before furnuture item removal from set, just in case
    assert item_in_room_instance_found
    item.rooms.remove(room)
    room_model_instance.refresh_from_db()
    item_in_room_instance_found = _check_item_in_room_view_and_v2(item.id, furniture_class, room_model_instance)
    assert not item_in_room_instance_found


@pytest.mark.django_db
@pytest.mark.parametrize("furniture_class", ["Bed", "Chair", "Table"])
@pytest.mark.parametrize("room_model", ["RoomsRelatedObjectsMaterializedView", "RoomWithRelatedObjsRebuildInApp"])
def test_furniture_rooms_set_add_reflected(furniture_class, room_model):
    item = _get_random_item_of_class(furniture_class)
    pks = Room.objects.filter(~Q(id__in=[o.id for o in item.rooms.all()])).values_list("pk", flat=True)
    random_pk = random.choice(pks)
    room = Room.objects.get(pk=random_pk)
    model = apps.get_model("rooms", room_model)
    room_model_instance = model.objects.get(pk=room.id)
    item_in_room_instance_found = _check_item_in_room_view_and_v2(item.id, furniture_class, room_model_instance)
    # before furnuture item addition to the set, just in case
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
    [("RoomsRelatedObjectsMaterializedView", "rooms_mat_view"), ("RoomWithRelatedObjsRebuildInApp", "rooms_v2")],
)
def test_window_fittings_change_reflected_in_all_room_models(room_model_name, room_model_url):
    """
    Integration test. Modify the name of the WindowFittings instance using PATCH call
    to its API URL. Ensure this change is reflected in related rooms -
    PostgreSQL materialized view and solution V2.
    Obtain the data for checks using GET calls to the URLs of the room models.
    """

    # arrange
    wf = _get_random_item_of_class("WindowFittings")
    window = wf.windows.first()
    room = window.room
    room_model = apps.get_model("rooms", room_model_name)
    room_instance = room_model.objects.get(pk=room.pk)
    url = reverse("window_fittings-list") + str(wf.pk) + "/"
    letters = string.ascii_letters
    new_wf_name = "".join(random.choice(letters) for i in range(10))
    data = {"name": new_wf_name}
    client = APIClient()

    # act
    response = client.patch(url, data=data, format="json")
    print(f"{response.status_code=}")
    room_instance.refresh_from_db()

    # assertions
    url = reverse(room_model_url + "-list") + str(room.pk) + "/"
    response = client.get(url, format="json")
    assert response.status_code == status.HTTP_200_OK
    window_filtered = [obj for obj in response.data["windows"] if obj["id"] == window.pk]
    wf_filtered = [obj for obj in window_filtered[0]["fittings"] if obj["id"] == wf.pk]
    wf_name_obtained = wf_filtered[0]["name"]
    assert wf_name_obtained == new_wf_name
