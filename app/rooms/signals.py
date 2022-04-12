import logging
from django.db import connection
from django.db.models.signals import post_save, m2m_changed
from django.dispatch import receiver
from rooms.models import WindowFittings, Window, Door, Souvenir, Decoration, Room, Chair, Bed, Table, RoomWithRelatedObjsRebuildInApp
from rooms.serializers import DecorationSerializer, DoorSerializer, RoomSerializer

logger = logging.getLogger(__name__)


@receiver(post_save, sender=WindowFittings)
@receiver(post_save, sender=Window)
@receiver(post_save, sender=Door)
@receiver(post_save, sender=Souvenir)
@receiver(post_save, sender=Decoration)
@receiver(post_save, sender=Room)
@receiver(post_save, sender=Chair)
@receiver(post_save, sender=Bed)
@receiver(post_save, sender=Table)
@receiver(m2m_changed, sender=Decoration.souvenirs.through)
@receiver(m2m_changed, sender=WindowFittings.windows.through)
@receiver(m2m_changed, sender=Chair.rooms.through)
@receiver(m2m_changed, sender=Table.rooms.through)
@receiver(m2m_changed, sender=Bed.rooms.through)
def update_view_rooms_related_objects(sender, **kwargs):
    # simple code but costly execution
    # because it rebuilds all rooms,
    # including those that don't need to be recalculated.
    with connection.cursor() as cursor:
        cursor.execute(
            "REFRESH MATERIALIZED VIEW CONCURRENTLY rooms_related_objects;")


def create_room_with_related_objs(room_id):
    logger.info(msg="; create_room_with_related_objs: " + str(room_id))
    source_room = Room.objects.filter(id=room_id).first()
    if not source_room:
        logger.error(msg="; not found room with ID " + str(room_id))
        return
    if RoomWithRelatedObjsRebuildInApp.objects.filter(
            id=room_id).exists():
        logger.error(msg="; found RoomWithRelatedObjsRebuildInApp with ID " +
                     str(room_id) + ", no need to create new")
        return
    source_room_data = RoomSerializer(source_room).data
    room_with_related_objs = RoomWithRelatedObjsRebuildInApp(id=room_id)

    # add door data
    door_obj = source_room.door
    door_data = DoorSerializer(door_obj).data
    room_with_related_objs.door = door_data

    # add decoration (souvenirs set) data
    decoration_obj = source_room.decoration
    decoration_data = DecorationSerializer(decoration_obj).data
    room_with_related_objs.decoration = decoration_data

    # add chairs, beds, and tables
    room_with_related_objs.chairs = source_room_data['chairs']
    room_with_related_objs.beds = source_room_data['beds']
    room_with_related_objs.tables = source_room_data['tables']

    # add native parameters
    room_with_related_objs.name = source_room_data['name']
    room_with_related_objs.width = source_room_data['width']
    room_with_related_objs.length = source_room_data['length']
    room_with_related_objs.height = source_room_data['height']
    room_with_related_objs.type = source_room_data['type']

    # add windows
    room_with_related_objs.windows = source_room_data['windows']

    room_with_related_objs.save()


def get_or_create_room_with_related_objs(room_id):
    room_with_related_objs = RoomWithRelatedObjsRebuildInApp.objects.filter(
        id=room_id).first()
    if room_with_related_objs:
        logger.info(msg="; RoomWithRelatedObjsRebuildInApp with ID " +
                    str(room_id) + " already exists")
        return room_with_related_objs
    else:
        create_room_with_related_objs(room_id)
        return None


@receiver(post_save, sender=Room)
def room_changes_update_related_room(sender, instance, **kwargs):
    logger.info(msg="; room_changes_update_related_room: " +
                str(instance.id))
    room_with_related_objs = get_or_create_room_with_related_objs(instance.id)
    if room_with_related_objs:
        source_room_data = RoomSerializer(instance).data
        room_with_related_objs.name = source_room_data['name']
        room_with_related_objs.width = source_room_data['width']
        room_with_related_objs.length = source_room_data['length']
        room_with_related_objs.height = source_room_data['height']
        room_with_related_objs.type = source_room_data['type']
        room_with_related_objs.save()


def _window_changed_process_related_rooms(window_instance):
    logger.info(msg="; _window_changed_process_related_rooms:")
    logger.info(msg="; window ID:" + str(window_instance.id))
    # every window has only one room, so simplified processing
    room = window_instance.room
    logger.info(msg="; room ID:" + str(room.id))
    room_with_related_objs = get_or_create_room_with_related_objs(room.id)
    if room_with_related_objs:
        source_room_data = RoomSerializer(room).data
        room_with_related_objs.windows = source_room_data['windows']
        room_with_related_objs.save()


@receiver(m2m_changed, sender=WindowFittings.windows.through)
def windows_fitting_m2m_changed_update_related_rooms(sender, pk_set, action, **kwargs):
    logger.info(
        msg="; windows_fitting_m2m_changed_update_related_rooms - action: " + action)
    if action != 'post_add' and action != 'post_remove':
        return
    for window_id in pk_set:
        window_by_id = Window.objects.filter(id=window_id).first()
        _window_changed_process_related_rooms(window_by_id)


@receiver(post_save, sender=WindowFittings)
def windows_fitting_changes_update_related_rooms(sender, instance, **kwargs):
    logger.info(msg="; windows_fitting_changes_update_related_rooms: " +
                str(instance.id))
    windows = instance.windows.all()
    for window in windows:
        _window_changed_process_related_rooms(window)


@receiver(post_save, sender=Window)
def window_changes_update_related_room(sender, instance, **kwargs):
    logger.info(msg="; window_changes_update_related_room: " +
                str(instance.id))
    _window_changed_process_related_rooms(instance)


@receiver(post_save, sender=Door)
def door_changed_update_related_rooms(sender, instance, **kwargs):
    logger.info(msg="; door_changed_update_related_rooms: " +
                str(instance.id))
    rooms = Room.objects.filter(door=instance)
    for room in rooms:
        room_with_related_objs = get_or_create_room_with_related_objs(room.id)
        if not room_with_related_objs:
            continue
        door_data = DoorSerializer(instance).data
        room_with_related_objs.door = door_data
        room_with_related_objs.save()


def _decoration_changed_process_related_rooms(decoration_instance):
    decoration_data = DecorationSerializer(decoration_instance).data
    rooms = Room.objects.filter(decoration=decoration_instance)
    for room in rooms:
        room_with_related_objs = get_or_create_room_with_related_objs(room.id)
        if not room_with_related_objs:
            continue
        room_with_related_objs.decoration = decoration_data
        room_with_related_objs.save()


@receiver(post_save, sender=Souvenir)
def souvenir_changed_update_related_rooms(sender, instance, **kwargs):
    logger.info(msg="; souvenir_changed_update_related_rooms: " +
                str(instance.id))
    decorations_related = Decoration.objects.filter(souvenirs=instance)
    for decoration_instance in decorations_related:
        _decoration_changed_process_related_rooms(decoration_instance)


@receiver(post_save, sender=Decoration)
def decoration_changed_update_related_rooms(sender, instance, **kwargs):
    logger.info(
        msg="; decoration_changed_update_related_rooms:" + str(instance.id))
    _decoration_changed_process_related_rooms(instance)


@receiver(m2m_changed, sender=Decoration.souvenirs.through)
def decoration_souvenir_m2m_changed_update_related_rooms(sender, instance, action, **kwargs):
    logger.info(
        msg="; decoration_souvenir_m2m_changed_update_related_rooms - action: " + action)
    if action == 'post_add' or action == 'post_remove':
        _decoration_changed_process_related_rooms(instance)


@receiver(post_save, sender=Chair)
def chair_changed_update_related_rooms(sender, instance, **kwargs):
    logger.info(
        msg="; chair_changed_update_related_rooms - chair ID " + str(instance.id))
    rooms = instance.rooms.all()
    for room in rooms:
        room_with_related_objs = get_or_create_room_with_related_objs(room.id)
        if not room_with_related_objs:
            continue
        room_data = RoomSerializer(room).data
        room_with_related_objs.chairs = room_data['chairs']
        room_with_related_objs.save()


@receiver(post_save, sender=Bed)
def bed_changed_update_related_rooms(sender, instance, **kwargs):
    logger.info(
        msg="; beds_changed_update_related_rooms - beds ID " + str(instance.id))
    rooms = instance.rooms.all()
    for room in rooms:
        room_with_related_objs = get_or_create_room_with_related_objs(room.id)
        if not room_with_related_objs:
            continue
        room_data = RoomSerializer(room).data
        room_with_related_objs.beds = room_data['beds']
        room_with_related_objs.save()


@receiver(post_save, sender=Table)
def table_changed_update_related_rooms(sender, instance, **kwargs):
    logger.info(
        msg="; tables_changed_update_related_rooms - table ID " + str(instance.id))
    rooms = instance.rooms.all()
    for room in rooms:
        room_with_related_objs = get_or_create_room_with_related_objs(room.id)
        if not room_with_related_objs:
            continue
        room_data = RoomSerializer(room).data
        room_with_related_objs.tables = room_data['tables']
        room_with_related_objs.save()


@receiver(m2m_changed, sender=Chair.rooms.through)
def chair_rooms_m2m_changed_update_related_rooms(sender, pk_set, action, **kwargs):
    logger.info(msg="; chair_rooms_m2m_changed_update_related_rooms - " +
                "rooms pk_set: " + str(pk_set) + " action: " + action)
    if action != 'post_add' and action != 'post_remove':
        return
    for room_id in pk_set:
        room_with_related_objs = get_or_create_room_with_related_objs(
            room_id)
        if not room_with_related_objs:
            continue
        source_room = Room.objects.filter(id=room_id).first()
        source_room_data = RoomSerializer(source_room).data
        room_with_related_objs.chairs = source_room_data['chairs']
        room_with_related_objs.save()


@receiver(m2m_changed, sender=Bed.rooms.through)
def bed_rooms_m2m_changed_update_related_rooms(sender, pk_set, action, **kwargs):
    logger.info(msg="; bed_rooms_m2m_changed_update_related_rooms - " +
                "rooms pk_set: " + str(pk_set) + " action: " + action)
    if action != 'post_add' and action != 'post_remove':
        return
    for room_id in pk_set:
        room_with_related_objs = get_or_create_room_with_related_objs(
            room_id)
        if not room_with_related_objs:
            continue
        source_room = Room.objects.filter(id=room_id).first()
        source_room_data = RoomSerializer(source_room).data
        room_with_related_objs.beds = source_room_data['beds']
        room_with_related_objs.save()


@receiver(m2m_changed, sender=Table.rooms.through)
def table_rooms_m2m_changed_update_related_rooms(sender, pk_set, action, **kwargs):
    logger.info(msg="; table_rooms_m2m_changed_update_related_rooms - " +
                "rooms pk_set: " + str(pk_set) + " action: " + action)
    if action != 'post_add' and action != 'post_remove':
        return
    for room_id in pk_set:
        room_with_related_objs = get_or_create_room_with_related_objs(
            room_id)
        if not room_with_related_objs:
            continue
        source_room = Room.objects.filter(id=room_id).first()
        source_room_data = RoomSerializer(source_room).data
        room_with_related_objs.tables = source_room_data['tables']
        room_with_related_objs.save()
