import os
import random

import django
from model_bakery import baker

from rooms.models import (Bed, Chair, Decoration, Door, Room,
                          RoomWithRelatedObjsRebuildInApp, Souvenir, Table,
                          Window, WindowFittings)
from rooms.signals import create_room_with_related_objs

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "app.settings")
django.setup()


if __name__ == "__main__":
    RoomWithRelatedObjsRebuildInApp.objects.all().delete()
    Room.objects.all().delete()
    Door.objects.all().delete()
    Souvenir.objects.all().delete()
    Decoration.objects.all().delete()
    WindowFittings.objects.all().delete()
    Window.objects.all().delete()
    Chair.objects.all().delete()
    Bed.objects.all().delete()
    Table.objects.all().delete()
    print("Initial data deletion - OK")
    baker.make(Souvenir, _quantity=150)
    baker.make(Door, _quantity=250)
    souvenirs_all = list(Souvenir.objects.all())
    doors_all = list(Door.objects.all())
    print("Created souvenirs and doors - OK")
    items_quantity = 500
    baker.make(Chair, _quantity=items_quantity)
    baker.make(Bed, _quantity=items_quantity)
    baker.make(Table, _quantity=items_quantity)
    baker.make(WindowFittings, _quantity=items_quantity)
    chairs_all = list(Chair.objects.all())
    beds_all = list(Bed.objects.all())
    tables_all = list(Table.objects.all())
    win_fittings_all = list(WindowFittings.objects.all())
    print("Created initial chairs, beds, tables, windows fittings")
    for i in range(items_quantity):
        door_prepared = random.choice(doors_all)
        souvenirs_sample = random.sample(souvenirs_all, 5)
        decoration_prepared = baker.make(Decoration, souvenirs=souvenirs_sample)
        room = baker.make(Room, decoration=decoration_prepared, door=door_prepared)
        _ = baker.make(Window, _quantity=2, room=room)
        print("Created room and windows ", i + 1, " of ", items_quantity, " - OK")

    rooms = list(Room.objects.all())
    windows = list(Window.objects.all())

    for i in range(items_quantity):
        rooms_items = random.sample(rooms, 5)
        windows_items = random.sample(windows, 5)
        for rooms_item in rooms_items:
            chairs_all[i].rooms.add(rooms_item)
            beds_all[i].rooms.add(rooms_item)
            tables_all[i].rooms.add(rooms_item)
        for windows_item in windows_items:
            win_fittings_all[i].windows.add(windows_item)
        print("Created relations for rooms and windows ", i + 1, " of ", items_quantity, " - OK")
    for i in range(items_quantity):
        create_room_with_related_objs(rooms[i].id)
        print("Created RoomWithRelatedObjsRebuildInApp ", i + 1, " of ", items_quantity, " - OK")
