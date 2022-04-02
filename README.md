# Django PostgreSQL Materialized View Example
This project aims to demonstrate the usage of the PostgreSQL materialized view in Django to speed up a complex query. Here you will find the code that works, as well as explanations. The project uses a Django REST framework to manipulate the data in JSON format.

It makes sense to apply PostgreSQL materialized view if read requests occur more often than data modifications. The optimization may speed up the execution of reading requests. On the other hand, queries that insert, update, or delete data will take longer and consume more computing resources.

## Task
We have to provide the system users with JSON data about some object. Also, the data should contain all other entities associated with that object. We are dealing with a complex, bloated database schema. It includes many redundant models, and we are not allowed to get rid of them. Therefore, read requests are complex and resource-intensive. It often happens on legacy projects. 

Our primary entity is the room. Each room has one door. Also, the rooms have many-to-many relationships with different types of furniture: beds, tables, and chairs. Each room has one or more windows. In turn, windows have many-to-many relationships with window fittings. Among other things, the room may have a set of souvenirs, which is called decoration.

Here is a partial database diagram.

![database diagram](/misc/db_diagram.png)

And here is a Django `models.py` file.

```python
from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator


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
    CHOICES = (
        ("WFT1", "Window Fittings Type 1"),
        ("WFT2", "Window Fittings Type 2"),
        ("WFT3", "Window Fittings Type 3"),
    )
    type = models.CharField(
        max_length=5, choices=CHOICES
    )
    windows = models.ManyToManyField(Window, related_name="fittings")


class Chair (CommonInfo):
    CHOICES = (
        ("CHT1", "Chair Type 1"),
        ("CHT2", "Chair Type 2"),
        ("CHT3", "Chair Type 3"),
    )
    type = models.CharField(
        max_length=5, choices=CHOICES
    )
    rooms = models.ManyToManyField(Room, related_name="chairs")


class Bed (CommonInfo):
    CHOICES = (
        ("BT1", "Bed Type 1"),
        ("BT2", "Bed Type 2"),
        ("BT3", "Bed Type 3"),
    )
    type = models.CharField(
        max_length=5, choices=CHOICES
    )
    rooms = models.ManyToManyField(Room, related_name="beds")


class Table (CommonInfo):
    CHOICES = (
        ("TBLT1", "Table Type 1"),
        ("TBLT2", "Table Type 2"),
        ("TBLT3", "Table Type 3"),
    )
    type = models.CharField(
        max_length=5, choices=CHOICES
    )
    rooms = models.ManyToManyField(Room, related_name="tables")
```

The test database contains 500 rooms and the same number of furniture items, as well as 50 doors and 150 souvenirs. See the details in the `app/initial_db_fill.py` file. In practice, the number of objects can be in the millions, and the models can be much more complex. 

## Solution
First, you can explore how the required data is returned by the usual means of the Django REST framework. 

Take a look at the `app/rooms/serializers.py` and `app/rooms/views.py` files. In the serializers file, the `EagerLoadingMixin` class deserves attention. It effectively solves the common N+1 queries problem.

The most important view is the `RoomViewSet` class. It overrides the standard `get_queryset` method to take advantage of the `EagerLoadingMixin` functionality. 

Run the system in Docker containers using the supplied `docker-compose.yml` file. Please pay attention to the two command variants that it contains. It is enough to perform the initial filling of the database once. You won't have to spend time on it during the subsequent builds.
