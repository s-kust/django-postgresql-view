from django.db import models


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
