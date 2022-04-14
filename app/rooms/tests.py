import logging
import random
import string
import pytest

from rooms.models import Door, Room, RoomsRelatedObjectsMaterializedView, RoomWithRelatedObjsRebuildInApp

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
