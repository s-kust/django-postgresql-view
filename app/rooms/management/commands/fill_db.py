import random

from django.core.management.base import BaseCommand
from model_bakery import baker
from django.db import connection

from rooms.models import (
    Bed,
    Chair,
    Decoration,
    Door,
    Room,
    RoomWithRelatedObjsRebuildInApp,
    Souvenir,
    Table,
    Window,
    WindowFittings,
    RoomWithRelatedObjsV3,
)
from rooms.utils import create_room_with_related_objs


class Command(BaseCommand):
    help = "Fill the DB with fake data about rooms, their decorations and furniture."

    def add_arguments(self, parser):
        parser.add_argument(
            "items_quantity", type=int, help="How many instances to create: rooms, windows, chairs, beds etc."
        )

    def handle(self, *args, **kwargs):
        items_quantity = kwargs["items_quantity"]
        self._remove_all_items_from_db()
        self._create_supplementary_objects(how_many=items_quantity)
        souvenirs_all = list(Souvenir.objects.all())
        doors_all = list(Door.objects.all())
        self._create_rooms_and_windows(doors_all, souvenirs_all, how_many=items_quantity)
        chairs_all = list(Chair.objects.all())
        beds_all = list(Bed.objects.all())
        tables_all = list(Table.objects.all())
        win_fittings_all = list(WindowFittings.objects.all())
        rooms = list(Room.objects.all())
        windows = list(Window.objects.all())
        self._create_m2m_for_rooms_and_windows(
            rooms, windows, chairs_all, beds_all, tables_all, win_fittings_all, how_many=items_quantity
        )
        for i in range(items_quantity):
            create_room_with_related_objs(rooms[i].id)
            self.stdout.write(
                self.style.SUCCESS("Created RoomWithRelatedObjsRebuildInApp %s of %s - OK" % (i + 1, items_quantity))
            )
        with connection.cursor() as cursor:
            cursor.execute(
                """INSERT INTO rooms_roomwithrelatedobjsv3
                                SELECT *
                                FROM rooms_related_objects
                                ON CONFLICT (ID)
                                DO UPDATE
                                SET door = EXCLUDED.door,
                                    decoration = EXCLUDED.decoration,
                                    windows = EXCLUDED.windows,
                                    name = EXCLUDED.name,
                                    width = EXCLUDED.width,
                                    length = EXCLUDED.length,
                                    height = EXCLUDED.height,
                                    type = EXCLUDED.type,
                                    beds = EXCLUDED.beds,
                                    chairs = EXCLUDED.chairs,
                                    tables = EXCLUDED.tables;"""
            )

    def _remove_all_items_from_db(self):
        RoomWithRelatedObjsRebuildInApp.objects.all().delete()
        RoomWithRelatedObjsV3.objects.all().delete()
        Room.objects.all().delete()
        Door.objects.all().delete()
        Souvenir.objects.all().delete()
        Decoration.objects.all().delete()
        WindowFittings.objects.all().delete()
        Window.objects.all().delete()
        Chair.objects.all().delete()
        Bed.objects.all().delete()
        Table.objects.all().delete()
        self.stdout.write(self.style.SUCCESS("Initial data deletion - OK"))

    def _create_supplementary_objects(self, how_many=500):
        baker.make(Souvenir, _quantity=how_many)
        baker.make(Door, _quantity=how_many)
        baker.make(Chair, _quantity=how_many)
        baker.make(Bed, _quantity=how_many)
        baker.make(Table, _quantity=how_many)
        baker.make(WindowFittings, _quantity=how_many)
        self.stdout.write(self.style.SUCCESS("Created souvenirs, doors and furniture - OK"))

    def _create_rooms_and_windows(self, doors_list, souvenirs_list, how_many=500):
        for i in range(how_many):
            door_prepared = random.choice(doors_list)
            souvenirs_sample = random.sample(souvenirs_list, 5)
            decoration_prepared = baker.make(Decoration, souvenirs=souvenirs_sample)
            room = baker.make(Room, decoration=decoration_prepared, door=door_prepared)
            baker.make(Window, _quantity=2, room=room)
            self.stdout.write(self.style.SUCCESS("Created room and windows %s of %s - OK" % (i + 1, how_many)))

    def _create_m2m_for_rooms_and_windows(self, rooms_all, windows_all, chairs, beds, tables, fittings, how_many=500):
        for i in range(how_many):
            rooms_items = random.sample(rooms_all, 5)
            windows_items = random.sample(windows_all, 5)
            chairs[i].rooms.add(*rooms_items)
            beds[i].rooms.add(*rooms_items)
            tables[i].rooms.add(*rooms_items)
            fittings[i].windows.add(*windows_items)
            self.stdout.write(
                self.style.SUCCESS("Created relations for rooms and windows %s of %s - OK" % (i + 1, how_many))
            )
