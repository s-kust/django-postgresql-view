import random
import os
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'app.settings')
import django
django.setup()
from rooms.models import Door, Souvenir, Decoration, Room, Window, WindowFittings, Chair, Bed, Table
from model_bakery import baker


if __name__ == '__main__':
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
    _ = baker.make(Souvenir, _quantity=150)    
    _ = baker.make(Door, _quantity=50)
    souvenirs_all = list(Souvenir.objects.all())
    doors_all = list(Door.objects.all())
    print("Created souvenirs and doors - OK")
    items_quantity = 500
    for i in range(items_quantity):
        door_prepared = random.choice(doors_all)
        souvenirs_sample = random.sample(souvenirs_all, 5)
        decoration_prepared = baker.make(Decoration, souvenirs=souvenirs_sample)
        room = baker.make(
            Room, decoration=decoration_prepared, door=door_prepared)
        _ = baker.make(Window, room=room)
        _ = baker.make(Window, room=room)
        print("Created room and windows ", i+1, " of ", items_quantity, " - OK")

    rooms = list(Room.objects.all())
    windows = list(Window.objects.all())
    for i in range(items_quantity):
        rooms_items = random.sample(rooms, 3)
        windows_items = random.sample(windows, 3)
        chair = baker.make(Chair)
        bed = baker.make(Bed)
        table = baker.make(Table)
        windows_fittings = baker.make(WindowFittings)
        for rooms_item in rooms_items:
            chair.rooms.add(rooms_item)
            bed.rooms.add(rooms_item)
            table.rooms.add(rooms_item)
        chair.save()
        bed.save()
        table.save()
        for windows_item in windows_items:
            windows_fittings.windows.add(windows_item)
        windows_fittings.save()
        print("Created furniture and window fittings ", i+1, " of ", items_quantity, " - OK")
