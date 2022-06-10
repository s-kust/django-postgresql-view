import pgtrigger
from django.db import models

from .common_info import CommonInfo
from .room import Room
from .rooms_related_v3 import RoomWithRelatedObjsV3


@pgtrigger.register(
    pgtrigger.Trigger(
        name="room_v3_chair",
        level=pgtrigger.Row,
        when=pgtrigger.After,
        operation=pgtrigger.Update | pgtrigger.Insert | pgtrigger.Delete,
        func=f"""
            INSERT INTO {RoomWithRelatedObjsV3._meta.db_table}(id, chairs)
            WITH room_ids AS (
                SELECT
                rooms_chair_rooms.room_id
                FROM rooms_chair
                LEFT JOIN rooms_chair_rooms ON rooms_chair_rooms.chair_id = rooms_chair.id
                WHERE rooms_chair.id = OLD.id
            )
            SELECT
                room.id id,
                jsonb_agg(chair) chairs
            FROM  rooms_room room
            LEFT JOIN rooms_chair_rooms chair_i ON room.id = chair_i.room_id
            LEFT JOIN rooms_chair chair ON chair.id = chair_i.chair_id
            WHERE room.id IN (SELECT room_id FROM room_ids)
            GROUP BY room.id
            ON CONFLICT (id)
            DO
            UPDATE SET chairs = EXCLUDED.chairs;
            RETURN NULL;
    """,
    )
)
class Chair(CommonInfo):
    CHAIR_TYPE_CHOICES = (
        ("CHT1", "Chair Type 1"),
        ("CHT2", "Chair Type 2"),
        ("CHT3", "Chair Type 3"),
    )
    type = models.CharField(max_length=5, choices=CHAIR_TYPE_CHOICES)
    rooms = models.ManyToManyField(Room, related_name="chairs")


@pgtrigger.register(
    pgtrigger.Trigger(
        name="room_v3_bed",
        level=pgtrigger.Row,
        when=pgtrigger.After,
        operation=pgtrigger.Update | pgtrigger.Insert | pgtrigger.Delete,
        func=f"""
            INSERT INTO {RoomWithRelatedObjsV3._meta.db_table}(id, beds)
            WITH room_ids AS (
                SELECT
                rooms_bed_rooms.room_id
                FROM rooms_bed
                LEFT JOIN rooms_bed_rooms ON rooms_bed_rooms.bed_id = rooms_bed.id
                WHERE rooms_bed.id = OLD.id
            )
            SELECT
                room.id id,
                jsonb_agg(bed) beds
            FROM  rooms_room room
            LEFT JOIN rooms_bed_rooms bed_i ON room.id = bed_i.room_id
            LEFT JOIN rooms_bed bed ON bed.id = bed_i.bed_id
            WHERE room.id IN (SELECT room_id FROM room_ids)
            GROUP BY room.id
            ON CONFLICT (id)
            DO
            UPDATE SET beds = EXCLUDED.beds;
            RETURN NULL;
    """,
    )
)
class Bed(CommonInfo):
    BED_TYPE_CHOICES = (
        ("BT1", "Bed Type 1"),
        ("BT2", "Bed Type 2"),
        ("BT3", "Bed Type 3"),
    )
    type = models.CharField(max_length=5, choices=BED_TYPE_CHOICES)
    rooms = models.ManyToManyField(Room, related_name="beds")


@pgtrigger.register(
    pgtrigger.Trigger(
        name="room_v3_table",
        level=pgtrigger.Row,
        when=pgtrigger.After,
        operation=pgtrigger.Update | pgtrigger.Insert | pgtrigger.Delete,
        func=f"""
            INSERT INTO {RoomWithRelatedObjsV3._meta.db_table}(id, tables)
            WITH room_ids AS (
                SELECT
                rooms_table_rooms.room_id
                FROM rooms_table
                LEFT JOIN rooms_table_rooms ON rooms_table_rooms.table_id = rooms_table.id
                WHERE rooms_table.id = OLD.id
            )
            SELECT
                room.id id,
                jsonb_agg(table_model) tables
            FROM  rooms_room room
            LEFT JOIN rooms_table_rooms table_i ON room.id = table_i.room_id
            LEFT JOIN rooms_table table_model ON table_model.id = table_i.table_id
            WHERE room.id IN (SELECT room_id FROM room_ids)
            GROUP BY room.id
            ON CONFLICT (id)
            DO
            UPDATE SET tables = EXCLUDED.tables;
            RETURN NULL;
    """,
    )
)
class Table(CommonInfo):
    TABLE_TYPE_CHOICES = (
        ("TBLT1", "Table Type 1"),
        ("TBLT2", "Table Type 2"),
        ("TBLT3", "Table Type 3"),
    )
    type = models.CharField(max_length=5, choices=TABLE_TYPE_CHOICES)
    rooms = models.ManyToManyField(Room, related_name="tables")
