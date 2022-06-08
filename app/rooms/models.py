from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models


class CommonInfo(models.Model):
    name = models.CharField(max_length=30, unique=True)
    width = models.FloatField(
        validators=[MinValueValidator(1.0), MaxValueValidator(100.0)], default=1.0
    )
    length = models.FloatField(
        validators=[MinValueValidator(1.0), MaxValueValidator(100.0)], default=1.0
    )
    height = models.FloatField(
        validators=[MinValueValidator(1.0), MaxValueValidator(100.0)], default=1.0
    )

    class Meta:
        abstract = True


class Door(CommonInfo):
    CHOICES = (
        ("DT1", "Door Type 1"),
        ("DT2", "Door Type 2"),
        ("DT3", "Door Type 3"),
        ("DT4", "Door Type 4"),
    )
    type = models.CharField(
        max_length=5, choices=CHOICES
    )


class Souvenir(models.Model):
    name = models.CharField(max_length=30, unique=True)


class Decoration(models.Model):
    name = models.CharField(max_length=30, unique=True)
    souvenirs = models.ManyToManyField(Souvenir, related_name="decorations")


class Room(CommonInfo):
    CHOICES = (
        ("KTCH", "Kitchen"),
        ("BDR", "Bedroom"),
        ("LBB", "Lobby"),
        ("LRM", "Living Room"),
    )
    type = models.CharField(
        max_length=5, choices=CHOICES
    )
    door = models.ForeignKey(
        Door, on_delete=models.PROTECT, related_name="rooms")
    decoration = models.ForeignKey(
        Decoration, null=True, on_delete=models.SET_NULL, related_name="rooms")


class Window(CommonInfo):
    CHOICES = (
        ("WT1", "Window Type 1"),
        ("WT2", "Window Type 2"),
        ("WT3", "Window Type 3"),
    )
    type = models.CharField(
        max_length=5, choices=CHOICES
    )
    room = models.ForeignKey(
        Room, on_delete=models.CASCADE, related_name="windows")


class WindowFittings (CommonInfo):
    WF_CHOICES = (
        ("WFT1", "Window Fittings Type 1"),
        ("WFT2", "Window Fittings Type 2"),
        ("WFT3", "Window Fittings Type 3"),
    )
    type = models.CharField(
        max_length=5, choices=WF_CHOICES
    )
    windows = models.ManyToManyField(Window, related_name="fittings")


class Chair (CommonInfo):
    CHAIR_TYPE_CHOICES = (
        ("CHT1", "Chair Type 1"),
        ("CHT2", "Chair Type 2"),
        ("CHT3", "Chair Type 3"),
    )
    type = models.CharField(
        max_length=5, choices=CHAIR_TYPE_CHOICES
    )
    rooms = models.ManyToManyField(Room, related_name="chairs")


class Bed (CommonInfo):
    BED_TYPE_CHOICES = (
        ("BT1", "Bed Type 1"),
        ("BT2", "Bed Type 2"),
        ("BT3", "Bed Type 3"),
    )
    type = models.CharField(
        max_length=5, choices=BED_TYPE_CHOICES
    )
    rooms = models.ManyToManyField(Room, related_name="beds")


class Table (CommonInfo):
    TABLE_TYPE_CHOICES = (
        ("TBLT1", "Table Type 1"),
        ("TBLT2", "Table Type 2"),
        ("TBLT3", "Table Type 3"),
    )
    type = models.CharField(
        max_length=5, choices=TABLE_TYPE_CHOICES
    )
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
        db_table = 'rooms_related_objects'


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
