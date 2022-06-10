import pgtrigger
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models


class CommonInfo(models.Model):
    name = models.CharField(max_length=30, unique=True)
    width = models.FloatField(validators=[MinValueValidator(1.0), MaxValueValidator(100.0)], default=1.0)
    length = models.FloatField(validators=[MinValueValidator(1.0), MaxValueValidator(100.0)], default=1.0)
    height = models.FloatField(validators=[MinValueValidator(1.0), MaxValueValidator(100.0)], default=1.0)

    class Meta:
        abstract = True


class RoomWithRelatedObjsV3(models.Model):
    id = models.BigIntegerField(primary_key=True)
    door = models.JSONField(blank=True, null=True)
    decoration = models.JSONField(blank=True, null=True)
    windows = models.JSONField(blank=True, null=True)
    name = models.CharField(max_length=30, blank=True, null=True)
    width = models.FloatField(blank=True, null=True)
    length = models.FloatField(blank=True, null=True)
    height = models.FloatField(blank=True, null=True)
    type = models.CharField(max_length=5, blank=True, null=True)
    beds = models.JSONField(blank=True, null=True)
    chairs = models.JSONField(blank=True, null=True)
    tables = models.JSONField(blank=True, null=True)


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


@pgtrigger.register(
    pgtrigger.Trigger(
        name="room_v3_souvenir",
        level=pgtrigger.Row,
        when=pgtrigger.After,
        operation=pgtrigger.Update | pgtrigger.Insert | pgtrigger.Delete,
        func=f"""
            INSERT INTO {RoomWithRelatedObjsV3._meta.db_table}(id, decoration)
            WITH decoraition_ids AS(
                SELECT decoration_id from rooms_decoration_souvenirs where souvenir_id=OLD.id
                )
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
            WHERE room.decoration_id IN (SELECT decoration_id from decoraition_ids)
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
class Souvenir(models.Model):
    name = models.CharField(max_length=30, unique=True)


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


class RoomsRelatedObjectsMaterializedView(models.Model):
    id = models.BigIntegerField(primary_key=True)
    door = models.JSONField(blank=True, null=True)
    decoration = models.JSONField(blank=True, null=True)
    windows = models.JSONField(blank=True, null=True)
    name = models.CharField(max_length=30, blank=True, null=True)
    width = models.FloatField(blank=True, null=True)
    length = models.FloatField(blank=True, null=True)
    height = models.FloatField(blank=True, null=True)
    type = models.CharField(max_length=5, blank=True, null=True)
    beds = models.JSONField(blank=True, null=True)
    chairs = models.JSONField(blank=True, null=True)
    tables = models.JSONField(blank=True, null=True)

    class Meta:
        managed = False  # Created from a view. Don't remove.
        db_table = "rooms_related_objects"


class RoomWithRelatedObjsRebuildInApp(models.Model):
    id = models.BigIntegerField(primary_key=True)
    door = models.JSONField(blank=True, null=True)
    decoration = models.JSONField(blank=True, null=True)
    windows = models.JSONField(blank=True, null=True)
    name = models.CharField(max_length=30, blank=True, null=True)
    width = models.FloatField(blank=True, null=True)
    length = models.FloatField(blank=True, null=True)
    height = models.FloatField(blank=True, null=True)
    type = models.CharField(max_length=5, blank=True, null=True)
    beds = models.JSONField(blank=True, null=True)
    chairs = models.JSONField(blank=True, null=True)
    tables = models.JSONField(blank=True, null=True)
