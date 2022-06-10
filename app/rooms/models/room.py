import pgtrigger
from django.db import models

from .common_info import CommonInfo
from .decoration import Decoration
from .door import Door
from .rooms_related_v3 import RoomWithRelatedObjsV3


@pgtrigger.register(
    pgtrigger.Trigger(
        name="room_v3_common_info",
        level=pgtrigger.Row,
        when=pgtrigger.After,
        operation=pgtrigger.Update | pgtrigger.Insert | pgtrigger.Delete,
        func=f"""
            INSERT INTO {RoomWithRelatedObjsV3._meta.db_table}(id, name, width, length, height, type)
            SELECT
                room.id id,
                room.name name,
                room.width width,
                room.length length,
                room.height height,
                room.type type
            FROM
                rooms_room room
            WHERE room.id = OLD.id
            ON CONFLICT (id)
            DO
            UPDATE SET name = EXCLUDED.name,
            width = EXCLUDED.width,
            length = EXCLUDED.length,
            height = EXCLUDED.height,
            type = EXCLUDED.type;
            RETURN NULL;
    """,
    )
)
class Room(CommonInfo):
    CHOICES = (
        ("KTCH", "Kitchen"),
        ("BDR", "Bedroom"),
        ("LBB", "Lobby"),
        ("LRM", "Living Room"),
    )
    type = models.CharField(max_length=5, choices=CHOICES)
    door = models.ForeignKey(Door, on_delete=models.PROTECT, related_name="rooms")
    decoration = models.ForeignKey(Decoration, null=True, on_delete=models.SET_NULL, related_name="rooms")
