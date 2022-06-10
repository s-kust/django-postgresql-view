import pgtrigger
from django.db import models

from .common_info import CommonInfo
from .room import Room
from .rooms_related_v3 import RoomWithRelatedObjsV3


@pgtrigger.register(
    pgtrigger.Trigger(
        name="room_v3_windows",
        level=pgtrigger.Row,
        when=pgtrigger.After,
        operation=pgtrigger.Update | pgtrigger.Insert | pgtrigger.Delete,
        func=f"""
            INSERT INTO {RoomWithRelatedObjsV3._meta.db_table}(id, windows)
            WITH room_window_fittings AS (
                SELECT
                room_id,
            json_build_object(
            'id',
            win.id,
            'name',
            win.name,
            'width',
            win.width,
            'length',
            win.length,
            'height',
            win.height,
            'type',
            win.type,
            'fittings',
            jsonb_agg(wf)
            ) window_in_room
            FROM rooms_window win
            LEFT JOIN rooms_windowfittings_windows rwfw ON rwfw.window_id = win.id
            LEFT JOIN rooms_windowfittings wf ON wf.id = rwfw.windowfittings_id
            WHERE win.id = OLD.id
            GROUP BY room_id, win.id
            )
            SELECT
                room_window_fittings.room_id AS id,
                jsonb_agg(
                room_window_fittings.window_in_room
                ) windows
            FROM room_window_fittings
            GROUP BY id
            ON CONFLICT (id)
            DO
            UPDATE SET windows = EXCLUDED.windows;
            RETURN NULL;
    """,
    )
)
class Window(CommonInfo):
    CHOICES = (
        ("WT1", "Window Type 1"),
        ("WT2", "Window Type 2"),
        ("WT3", "Window Type 3"),
    )
    type = models.CharField(max_length=5, choices=CHOICES)
    room = models.ForeignKey(Room, on_delete=models.CASCADE, related_name="windows")
