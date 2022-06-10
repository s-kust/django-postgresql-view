import pgtrigger
from django.db import models

from .common_info import CommonInfo
from .rooms_related_v3 import RoomWithRelatedObjsV3


@pgtrigger.register(
    pgtrigger.Trigger(
        name="room_v3_door",
        level=pgtrigger.Row,
        when=pgtrigger.After,
        operation=pgtrigger.Update | pgtrigger.Insert | pgtrigger.Delete,
        func=f"""
            INSERT INTO {RoomWithRelatedObjsV3._meta.db_table}(id, door)
            SELECT
                room.id id,
                jsonb_build_object(
                'id', door.id, 'name', door.name, 'width',
                door.width, 'length', door.length,
                'height', door.height, 'type', door.type
                ) door
            FROM
                rooms_room room
                LEFT JOIN rooms_door door ON room.door_id = door.id
            WHERE room.door_id = OLD.id
            ON CONFLICT (id)
            DO
            UPDATE SET door = EXCLUDED.door;
            RETURN NULL;
    """,
    )
)
class Door(CommonInfo):
    CHOICES = (
        ("DT1", "Door Type 1"),
        ("DT2", "Door Type 2"),
        ("DT3", "Door Type 3"),
        ("DT4", "Door Type 4"),
    )
    type = models.CharField(max_length=5, choices=CHOICES)
