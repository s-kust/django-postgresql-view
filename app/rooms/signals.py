import logging

from django.db import connection
from django.db.models.signals import m2m_changed, post_save
from django.dispatch import receiver

from rooms.models import (Bed, Chair, Decoration, Door, Room,
                          RoomWithRelatedObjsRebuildInApp, Souvenir, Table,
                          Window, WindowFittings)
from rooms.serializers import (DecorationSerializer, DoorSerializer,
                               RoomSerializer)
from rooms.utils import create_room_with_related_objs

logger = logging.getLogger(__name__)

#############################################
# Approach 1 - PostgreSQL Materialized View #
#############################################


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
    # because it rebuilds all rooms everytime,
    # including those that don't need to be recalculated.
    with connection.cursor() as cursor:
        cursor.execute("REFRESH MATERIALIZED VIEW CONCURRENTLY rooms_related_objects;")


################################################
# Approach 2 - new 'artificial' model          #
# RoomWithRelatedObjsRebuildInApp              #
# that stores rooms parameters                 #
# together with all their related objects data #
################################################


def get_or_create_room_with_related_objs(room_id: int) -> None:
    """
    If RoomWithRelatedObjsRebuildInApp object does not exist for a given room ID,
    call the create_room_with_related_objs function to create it from scratch
    and build all its fields that store JSON data about related objects.
    Otherwise, return the found object, so the calling functiion will rebuild
    only the fields that have changed, and not all of them.
    """
    room_with_related_objs = RoomWithRelatedObjsRebuildInApp.objects.filter(id=room_id).first()
    if room_with_related_objs:
        logger.info(msg="; RoomWithRelatedObjsRebuildInApp with ID " + str(room_id) + " already exists")
        return room_with_related_objs
    else:
        create_room_with_related_objs(room_id)
        return None


# Whenever something changes (window, souvenirs, furniture, etc.),
# we have to rebuild all the rooms that contain the changed object.


@receiver(post_save, sender=Room)
def room_changes_update_related_room(sender, instance, **kwargs):
    logger.info(msg="; room_changes_update_related_room: " + str(instance.id))
    room_with_related_objs = get_or_create_room_with_related_objs(instance.id)
    if room_with_related_objs:
        source_room_data = RoomSerializer(instance).data
        room_with_related_objs.name = source_room_data["name"]
        room_with_related_objs.width = source_room_data["width"]
        room_with_related_objs.length = source_room_data["length"]
        room_with_related_objs.height = source_room_data["height"]
        room_with_related_objs.type = source_room_data["type"]
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
        room_with_related_objs.windows = source_room_data["windows"]
        room_with_related_objs.save()


@receiver(m2m_changed, sender=WindowFittings.windows.through)
def windows_fitting_m2m_changed_update_related_rooms(sender, pk_set, action, **kwargs):
    logger.info(msg="; windows_fitting_m2m_changed_update_related_rooms - action: " + action)
    if action != "post_add" and action != "post_remove":
        return
    for window_id in pk_set:
        window_by_id = Window.objects.filter(id=window_id).first()
        _window_changed_process_related_rooms(window_by_id)


@receiver(post_save, sender=WindowFittings)
def windows_fitting_changes_update_related_rooms(sender, instance, **kwargs):
    logger.info(msg="; windows_fitting_changes_update_related_rooms: " + str(instance.id))
    windows = instance.windows.all()
    for window in windows:
        _window_changed_process_related_rooms(window)


@receiver(post_save, sender=Window)
def window_changes_update_related_room(sender, instance, **kwargs):
    logger.info(msg="; window_changes_update_related_room: " + str(instance.id))
    _window_changed_process_related_rooms(instance)


@receiver(post_save, sender=Door)
def door_changed_update_related_rooms(sender, instance, **kwargs):
    logger.info(msg="; door_changed_update_related_rooms: " + str(instance.id))
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
    logger.info(msg="; souvenir_changed_update_related_rooms: " + str(instance.id))
    decorations_related = Decoration.objects.filter(souvenirs=instance)
    for decoration_instance in decorations_related:
        _decoration_changed_process_related_rooms(decoration_instance)


@receiver(post_save, sender=Decoration)
def decoration_changed_update_related_rooms(sender, instance, **kwargs):
    logger.info(msg="; decoration_changed_update_related_rooms:" + str(instance.id))
    _decoration_changed_process_related_rooms(instance)


@receiver(m2m_changed, sender=Decoration.souvenirs.through)
def decoration_souvenir_m2m_changed_update_related_rooms(sender, instance, action, **kwargs):
    logger.info(msg="; decoration_souvenir_m2m_changed_update_related_rooms - action: " + action)
    if action == "post_add" or action == "post_remove":
        _decoration_changed_process_related_rooms(instance)


def _check_item_is_furniture(item):
    is_bed = item.__class__.__name__ == "Bed"
    is_table = item.__class__.__name__ == "Table"
    is_chair = item.__class__.__name__ == "Chair"
    if not is_bed and not is_table and not is_chair:
        logger.error(msg="; chair_bed_table_m2m_chng - wrong instance.__class__.__name__ - " + item.__class__.__name__)
        return False
    return True


def _furniture_update_room_related_data(room_id, class_name):
    room_with_related_data = get_or_create_room_with_related_objs(room_id)
    if not room_with_related_data:
        # room_with_related_data was not obtained
        # but created from scratch
        # and fully built, with all fields,
        # nothing to do here
        return
    source_room = Room.objects.filter(id=room_id).first()
    source_room_data = RoomSerializer(source_room).data
    if class_name == "Bed":
        room_with_related_data.beds = source_room_data["beds"]
    if class_name == "Chair":
        room_with_related_data.chairs = source_room_data["chairs"]
    if class_name == "Table":
        room_with_related_data.tables = source_room_data["tables"]
    room_with_related_data.save()


@receiver(post_save, sender=Chair)
@receiver(post_save, sender=Bed)
@receiver(post_save, sender=Table)
def chair_bed_table_changed_update_related_rooms(sender, instance, **kwargs):
    logger.info(
        msg="; chair_bed_table_changed_update_related_rooms - "
        + ", class - "
        + instance.__class__.__name__
        + ", instance ID - "
        + str(instance.id)
    )
    if not _check_item_is_furniture(instance):
        return
    rooms = instance.rooms.all()
    for room in rooms:
        _furniture_update_room_related_data(room.id, instance.__class__.__name__)


@receiver(m2m_changed, sender=Table.rooms.through)
@receiver(m2m_changed, sender=Bed.rooms.through)
@receiver(m2m_changed, sender=Chair.rooms.through)
def chair_bed_table_m2m_chng_update_related_rooms(sender, instance, pk_set, action, **kwargs):
    logger.info(
        msg="; chair_bed_table_m2m_chng_update_related_rooms - rooms pk_set: "
        + str(pk_set)
        + ", action: "
        + action
        + ", class - "
        + instance.__class__.__name__
    )
    if not _check_item_is_furniture(instance):
        return
    if action != "post_add" and action != "post_remove":
        return
    for room_id in pk_set:
        _furniture_update_room_related_data(room_id, instance.__class__.__name__)
