from django.db import connection
from django.db.models.signals import post_save, m2m_changed
from django.dispatch import receiver
from rooms.models import WindowFittings, Window, Door, Souvenir, Decoration, Room, Chair, Bed, Table


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
    with connection.cursor() as cursor:
        cursor.execute(
            "REFRESH MATERIALIZED VIEW CONCURRENTLY rooms_related_objects;")
