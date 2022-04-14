import logging
import random
import string
import pytest

from rooms.models import Door, Room, RoomsRelatedObjectsMaterializedView, RoomWithRelatedObjsRebuildInApp, Chair, Table, Bed, WindowFittings, Window

logger = logging.getLogger(__name__)


@pytest.mark.django_db
def test_door_change_reflected_in_its_rooms():
    door_with_rooms_assigned_found = False
    all_doors = list(Door.objects.all())
    while not door_with_rooms_assigned_found:
        door_instance = random.choice(all_doors)
        if door_instance.rooms.first():
            door_with_rooms_assigned_found = True
    letters = string.ascii_letters
    for room in door_instance.rooms.all():
        room_view = RoomsRelatedObjectsMaterializedView.objects.get(pk=room.id)
        room_2 = RoomWithRelatedObjsRebuildInApp.objects.get(pk=room.id)
        assert door_instance.name == room_view.door['name'] == room_2.door['name']
    new_door_name = ''.join(random.choice(letters) for i in range(10))
    door_instance.name = new_door_name
    door_instance.save()
    for room in door_instance.rooms.all():
        room_view = RoomsRelatedObjectsMaterializedView.objects.get(pk=room.id)
        room_2 = RoomWithRelatedObjsRebuildInApp.objects.get(pk=room.id)
        room_view.refresh_from_db()
        room_2.refresh_from_db()
        assert room_view.door['name'] == new_door_name == room_2.door['name']


def _search_fitting_in_room_view_or_v2(fitting_id, room_with_related_data):
    found_fitting = False
    fitting_name = None
    for window in room_with_related_data.windows:
        if found_fitting:
            break
        for fitting in window['fittings']:
            if not fitting:
                break
            if fitting['id'] == fitting_id:
                found_fitting = True
                fitting_name = fitting['name']
                break
    return found_fitting, fitting_name


@pytest.mark.django_db
def test_window_fitting_change_reflected_in_its_rooms():
    # fittings have several windows,
    # every window has one room
    fittings_all = list(WindowFittings.objects.all())
    fitting = random.choice(fittings_all)
    letters = string.ascii_letters
    new_wf_name = ''.join(random.choice(letters) for i in range(10))
    fitting.name = new_wf_name
    fitting.save()
    rooms_set = set()
    for window in fitting.windows.all():
        rooms_set.add(window.room)
    for room in rooms_set:
        room_view = RoomsRelatedObjectsMaterializedView.objects.get(pk=room.id)
        room_2 = RoomWithRelatedObjsRebuildInApp.objects.get(pk=room.id)
        found_fitting_in_view, found_name_view = _search_fitting_in_room_view_or_v2(
            fitting.id, room_view)
        assert found_fitting_in_view
        assert found_name_view == new_wf_name
        found_fitting_in_v2, found_name_v2 = _search_fitting_in_room_view_or_v2(
            fitting.id, room_2)
        assert found_fitting_in_v2
        assert found_name_v2 == new_wf_name


@pytest.mark.django_db
def test_room_change_reflected_in_its_related_models():
    letters = string.ascii_letters
    all_rooms = list(Room.objects.all())
    room = random.choice(all_rooms)
    room_view = RoomsRelatedObjectsMaterializedView.objects.get(pk=room.id)
    room_2 = RoomWithRelatedObjsRebuildInApp.objects.get(pk=room.id)
    assert room.name == room_view.name == room_2.name
    new_room_name = ''.join(random.choice(letters) for i in range(10))
    room.name = new_room_name
    room.save()
    room_view.refresh_from_db()
    room_2.refresh_from_db()
    assert room.name == room_view.name == room_2.name == new_room_name


def _check_item_in_room_view_and_v2(item_id, furniture_class_name, room_view_obj, room_v2_obj):
    if furniture_class_name == 'Bed':
        furniture_in_room_view = room_view_obj.beds
        furniture_in_room_v2 = room_v2_obj.beds
    if furniture_class_name == 'Chair':
        furniture_in_room_view = room_view_obj.chairs
        furniture_in_room_v2 = room_v2_obj.chairs
    if furniture_class_name == 'Table':
        furniture_in_room_view = room_view_obj.tables
        furniture_in_room_v2 = room_v2_obj.tables
    item_in_room_view_found = False
    item_in_room_v2_found = False
    if len(furniture_in_room_view) == 0 or len(furniture_in_room_v2) == 0:
        return item_in_room_view_found, item_in_room_v2_found
    for elem in furniture_in_room_view:
        if elem['id'] == item_id:
            item_in_room_view_found = True
    for elem in furniture_in_room_v2:
        if elem['id'] == item_id:
            item_in_room_v2_found = True
    return item_in_room_view_found, item_in_room_v2_found


def _get_furniture_item_of_class(furniture_class_name):
    if furniture_class_name == 'Bed':
        items = list(Bed.objects.all())
    if furniture_class_name == 'Chair':
        items = list(Chair.objects.all())
    if furniture_class_name == 'Table':
        items = list(Table.objects.all())
    instance = random.choice(items)
    return instance


@pytest.mark.django_db
@pytest.mark.parametrize("furniture_class", ["Bed", "Chair", "Table"])
def test_furniture_rooms_set_remove_reflected(furniture_class):
    item = _get_furniture_item_of_class(furniture_class)
    room = item.rooms.first()
    room_view = RoomsRelatedObjectsMaterializedView.objects.get(pk=room.id)
    room_v2 = RoomWithRelatedObjsRebuildInApp.objects.get(pk=room.id)
    item_in_room_view_found, item_in_room_v2_found = _check_item_in_room_view_and_v2(
        item.id, furniture_class, room_view, room_v2)
    assert item_in_room_view_found
    assert item_in_room_v2_found
    item.rooms.remove(room)
    room_view.refresh_from_db()
    room_v2.refresh_from_db()
    item_in_room_view_found, item_in_room_v2_found = _check_item_in_room_view_and_v2(
        item.id, furniture_class, room_view, room_v2)
    assert not item_in_room_view_found
    assert not item_in_room_v2_found


@pytest.mark.django_db
@pytest.mark.parametrize("furniture_class", ["Bed", "Chair", "Table"])
def test_furniture_rooms_set_add_reflected(furniture_class):
    item = _get_furniture_item_of_class(furniture_class)
    all_rooms = list(Room.objects.all())
    found_room_not_in_item_rooms = False
    while not found_room_not_in_item_rooms:
        room = random.choice(all_rooms)
        if not room in item.rooms.all():
            found_room_not_in_item_rooms = True
    room_view = RoomsRelatedObjectsMaterializedView.objects.get(pk=room.id)
    room_v2 = RoomWithRelatedObjsRebuildInApp.objects.get(pk=room.id)
    item_in_room_view_found, item_in_room_v2_found = _check_item_in_room_view_and_v2(
        item.id, furniture_class, room_view, room_v2)
    assert not item_in_room_view_found
    assert not item_in_room_v2_found
    item.rooms.add(room)
    room_view.refresh_from_db()
    room_v2.refresh_from_db()
    item_in_room_view_found, item_in_room_v2_found = _check_item_in_room_view_and_v2(
        item.id, furniture_class, room_view, room_v2)
    assert item_in_room_view_found
    assert item_in_room_v2_found
