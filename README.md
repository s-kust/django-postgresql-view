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

```python
class RoomViewSet(viewsets.ModelViewSet):
    serializer_class = RoomSerializer

    def get_queryset(self):
        qs = Room.objects.all()
        qs = self.serializer_class.setup_eager_loading(qs)
        return qs
```

Run the system in Docker containers using the supplied `docker-compose.yml` file. Please pay attention to the two command variants that it contains. It is enough to perform the initial filling of the database once. You won't have to spend time on it during the subsequent builds. The `pgadmin` container will make it easier for you to explore the database and experiment with it.

After a successful start of the system, you can view information about all rooms at `localhost:8000/rooms/`, as well as about all the objects associated with them. Also, you can request information about individual rooms by their IDs, e.g. `localhost:8000/rooms/311/`. The test database is small, so these queries are quite fast. In practice, they can be extremely slow and annoying for users. They can be optimized using a PostgreSQL materialized view.

## The SQL Query That Creates the PostgreSQL Materialized View

The database schema is quite complex, similar to those encountered in practice. We can easily prepare complex queries to retrieve data from the database using the standard Django REST framework tools. See the `app/rooms/serializers.py` file as an example. 

Achieving the same result with pure SQL code can be difficult. However, sometimes speeding up queries execution may justify the effort. It depends on the relative frequency of requests to read and modify the data.

```SQL
CREATE materialized VIEW rooms_related_objects AS WITH room_id_door_decoration AS (
  SELECT 
    room.id id, 
    jsonb_build_object(
      'id', door.id, 'name', door.name, 'width', 
      door.width, 'length', door.length, 
      'height', door.height, 'type', door.type
    ) door, 
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
    LEFT JOIN rooms_door door ON room.door_id = door.id 
    LEFT JOIN rooms_decoration decoration ON room.decoration_id = decoration.id 
    LEFT JOIN rooms_decoration_souvenirs ds ON decoration.id = ds.decoration_id 
    LEFT JOIN rooms_souvenir souvenir ON ds.souvenir_id = souvenir.id 
  GROUP BY 
    room.id, 
    door.id, 
    decoration.id
), 
windows_in_room_by_id AS (
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
    FROM 
      rooms_window win 
      LEFT JOIN rooms_windowfittings_windows rwfw ON rwfw.window_id = win.id 
      LEFT JOIN rooms_windowfittings wf ON wf.id = rwfw.windowfittings_id 
    GROUP BY 
      room_id, 
      win.id
  ) 
  SELECT 
    room_window_fittings.room_id AS id, 
    jsonb_agg(
      room_window_fittings.window_in_room
    ) windows 
  FROM 
    room_window_fittings 
  GROUP BY 
    id
), 
parameters_and_beds_in_room_by_id AS (
  SELECT 
    room.id id, 
    room.name name, 
    room.width width, 
    room.length length, 
    room.height height, 
    room.type type, 
    jsonb_agg(bed) beds 
  FROM 
    rooms_room room 
    LEFT JOIN rooms_bed_rooms bed_i ON room.id = bed_i.room_id 
    LEFT JOIN rooms_bed bed ON bed.id = bed_i.bed_id 
  GROUP BY 
    room.id
), 
chairs_in_room_by_id AS (
  SELECT 
    room.id id, 
    jsonb_agg(chair) chairs 
  FROM 
    rooms_room room 
    LEFT JOIN rooms_chair_rooms chair_i ON room.id = chair_i.room_id 
    LEFT JOIN rooms_chair chair ON chair.id = chair_i.chair_id 
  GROUP BY 
    room.id
), 
tables_in_room_by_id AS (
  SELECT 
    room.id id, 
    jsonb_agg(table_f) tables 
  FROM 
    rooms_room room 
    LEFT JOIN rooms_table_rooms table_i ON room.id = table_i.room_id 
    LEFT JOIN rooms_table table_f ON table_f.id = table_i.table_id 
  GROUP BY 
    room.id
) 
SELECT 
  COALESCE(
    room_id_door_decoration.id, windows_in_room_by_id.id
  ) AS id, 
  room_id_door_decoration.door, 
  room_id_door_decoration.decoration, 
  windows_in_room_by_id.windows, 
  parameters_and_beds_in_room_by_id.name, 
  parameters_and_beds_in_room_by_id.width, 
  parameters_and_beds_in_room_by_id.length, 
  parameters_and_beds_in_room_by_id.height, 
  parameters_and_beds_in_room_by_id.type, 
  parameters_and_beds_in_room_by_id.beds, 
  chairs_in_room_by_id.chairs, 
  tables_in_room_by_id.tables 
FROM 
  room_id_door_decoration FULL 
  OUTER JOIN windows_in_room_by_id ON room_id_door_decoration.id = windows_in_room_by_id.id FULL 
  OUTER JOIN parameters_and_beds_in_room_by_id ON windows_in_room_by_id.id = parameters_and_beds_in_room_by_id.id FULL 
  OUTER JOIN chairs_in_room_by_id ON parameters_and_beds_in_room_by_id.id = chairs_in_room_by_id.id FULL 
  OUTER JOIN tables_in_room_by_id ON chairs_in_room_by_id.id = tables_in_room_by_id.id WITH DATA;
CREATE UNIQUE INDEX ON rooms_related_objects (id);
REFRESH MATERIALIZED VIEW CONCURRENTLY rooms_related_objects;
```

Notes to the SQL query text:
1. To obtain the data from the many-to-many relationship, we use the aggregation function `jsonb_agg`. We cannot utilize this function multiple times in a row. So we have to do several rather small WITH statements. For example, the statements `chairs_in_room_by_id` and `tables_in_room_by_id` cannot be combined. 
1. It is desirable to create an index of the view. Otherwise, it will not be possible to update the view asynchronously (CONCURRENTLY). To create an index, we run the query `CREATE UNIQUE INDEX ON rooms_related_objects (id)`.
1. Unless you have a good reason to use the regular JSON, use the binary JSON. In other words, use the `jsonb_build_object` function instead of the `json_build_object` function. Otherwise, the `TypeError: JSON object must be str, bytes or bytearray, not dict` may occur, and you will have to tinker to get rid of it.

The SQL code `REFRESH MATERIALIZED VIEW CONCURRENTLY rooms_related_objects;` is automatically executed whenever data in the database changes. The Django signals `post_save` and `m2m_changed` are used for that. See the file `app/rooms/signals.py` for details. Also, in the file `app/rooms/apps.py` see how the system receives indications that signals need to be processed.