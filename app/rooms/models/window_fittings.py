import pgtrigger
from django.db import models

from .common_info import CommonInfo
from .rooms_related_v3 import RoomWithRelatedObjsV3
from .window import Window


@pgtrigger.register(
    pgtrigger.Trigger(
        name="room_v3_window_fittings",
        level=pgtrigger.Row,
        when=pgtrigger.After,
        operation=pgtrigger.Update | pgtrigger.Insert | pgtrigger.Delete,
        func=f"""
            INSERT INTO {RoomWithRelatedObjsV3._meta.db_table}(id, windows)
            WITH room_ids AS (
                SELECT
                win.room_id
                FROM rooms_window win
                LEFT JOIN rooms_windowfittings_windows rwfw ON rwfw.window_id = win.id
                LEFT JOIN rooms_windowfittings wf ON wf.id = rwfw.windowfittings_id
                WHERE wf.id = OLD.id
                ),
            room_window_fittings AS (
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
            WHERE win.room_id IN (SELECT room_id FROM room_ids)
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
class WindowFittings(CommonInfo):
    WF_CHOICES = (
        ("WFT1", "Window Fittings Type 1"),
        ("WFT2", "Window Fittings Type 2"),
        ("WFT3", "Window Fittings Type 3"),
    )
    type = models.CharField(max_length=5, choices=WF_CHOICES)
    windows = models.ManyToManyField(Window, related_name="fittings")
