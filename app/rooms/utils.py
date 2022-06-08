import logging

from rooms.models import Room, RoomWithRelatedObjsRebuildInApp
from rooms.serializers import (DecorationSerializer, DoorSerializer,
                               RoomSerializer)

logger = logging.getLogger(__name__)


def create_room_with_related_objs(room_id: int) -> None:
    logger.info(msg="; create_room_with_related_objs: " + str(room_id))

    # Make sure the given room ID is valid
    source_room = Room.objects.filter(id=room_id).first()
    if not source_room:
        logger.error(msg="; not found room with ID " + str(room_id))
        return

    # All the work of building up-to-date data
    # about related objects is performed by the RoomSerializer,
    # which is called here.
    source_room_data = RoomSerializer(source_room).data
    room_with_related_objs = RoomWithRelatedObjsRebuildInApp(id=room_id)

    # add door data
    door_data = DoorSerializer(source_room.door).data
    room_with_related_objs.door = door_data

    # add decoration (souvenirs set) data
    decoration_data = DecorationSerializer(source_room.decoration).data
    room_with_related_objs.decoration = decoration_data

    # add chairs, beds, and tables
    room_with_related_objs.chairs = source_room_data["chairs"]
    room_with_related_objs.beds = source_room_data["beds"]
    room_with_related_objs.tables = source_room_data["tables"]

    # add native parameters
    room_with_related_objs.name = source_room_data["name"]
    room_with_related_objs.width = source_room_data["width"]
    room_with_related_objs.length = source_room_data["length"]
    room_with_related_objs.height = source_room_data["height"]
    room_with_related_objs.type = source_room_data["type"]

    # add windows and window fittings
    room_with_related_objs.windows = source_room_data["windows"]

    room_with_related_objs.save()
