import pgtrigger
from django.db import models

from .rooms_related_v3 import RoomWithRelatedObjsV3
from .souvenir import Souvenir


@pgtrigger.register(
    pgtrigger.Trigger(
        name="room_v3_decoration",
        level=pgtrigger.Row,
        when=pgtrigger.After,
        operation=pgtrigger.Update | pgtrigger.Insert | pgtrigger.Delete,
        func=f"""
            INSERT INTO {RoomWithRelatedObjsV3._meta.db_table}(id, decoration)
            SELECT
                room.id id,
                jsonb_build_object(
                'id',
                decoration.id,
                'name',
                decoration.name,
                'souvenirs',
                jsonb_agg(souvenir)
                ) decoration
            FROM
                rooms_room room
                LEFT JOIN rooms_decoration decoration ON room.decoration_id = decoration.id
                LEFT JOIN rooms_decoration_souvenirs ds ON decoration.id = ds.decoration_id
                LEFT JOIN rooms_souvenir souvenir ON ds.souvenir_id = souvenir.id
            WHERE room.decoration_id = OLD.id
            GROUP BY
                room.id,
                decoration.id
            ON CONFLICT (id)
            DO
            UPDATE SET decoration = EXCLUDED.decoration;
            RETURN NULL;
    """,
    )
)
class Decoration(models.Model):
    name = models.CharField(max_length=30, unique=True)
    souvenirs = models.ManyToManyField(Souvenir, related_name="decorations")
