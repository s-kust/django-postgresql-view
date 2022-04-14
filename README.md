# Django PostgreSQL Materialized View Example
Initially, this project aimed to demonstrate the usage of the PostgreSQL materialized view in Django to cache the results of the complex SELECT query with many JOIN operations. The task is described in detail below. Such assignments of optimizing costly queries often appear in real-world practice. 

The PostgreSQL materialized view in the database contains the cached result of some intricate SELECT query execution. The optimization is to return the cached data from the view instead of re-executing queries. Of course, we try to speed up the users' requests execution. At the same time, it is also crucial to prevent users from getting stale cached data.

Later, the author realized that the PostgreSQL materialized view is not the best way to solve the assignments. More on this below. Therefore, I have added another way to solve the same problem. 

In this repository, you can find two solutions to the same problem. One solution uses a PostgreSQL materialized view, and the other does not. If you build and run the application, you'll see both approaches at work. The Django `post_save` and `m2m_changed` signals trigger them concurrently. 

Of course, running two solutions together is redundant. Only one of them should be used in a real-world project. It depends on how urgently one needs to update the cached data. If you don't need to do this immediately after the event, the PostgreSQL materialized view might be the best option.

## How This Repository Can Help You

Here you can find the code that works, as well as explanations. The project uses a Django REST framework to manipulate the data in JSON format.

It does not always make sense to apply the methods shown here. They are only helpful if SELECT requests occur more often than data modifications. The optimization may speed up the execution of reading requests. On the other hand, queries that insert, update, or delete data will take longer and consume more computing resources.

In this repository, you can find working examples of the following:
1. PostgreSQL materialized view in Django.
1. `EagerLoadingMixin` in Django REST framework serializer classes to solve the N+1 queries problem.
1. Updating the instances that have nested serializers. You can explicitly write update methods in the serializer class. Or you can simply mark nested serializers as read-only. The `app/rooms/serializers.py` file contains examples of both approaches.
1. Usage of the most generic `viewsets.ModelViewSet` to build views in Django REST framework fast and easy. 
1. Advanced PostgreSQL SQL query with several Common Table Expressions and JSON functions. See the `migrations.RunSQL` code in the `app/rooms/migrations/0004_roomsrelatedobjects.py` file. 
1. Usage of Django `post_save` and `m2m_changed` signals, see the `app/rooms/signals.py` file.
1. Processing of the actions during the `m2m_changed` signal handling.
1. Populating the Django database with fake generated data for testing. See the `app/initial_db_fill.py` file.
1. Logging configuration and usage in Django, see files `app/app/settings.py` and `app/rooms/signals.py`.

## Task
We have to provide the users with JSON data about some object. The data should contain all other entities associated with that object. We are dealing with a complex, bloated database schema. It includes many redundant models, and we are not allowed to get rid of them. Therefore, read requests are complex and resource-intensive. It often happens on legacy projects. 

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

## The Django PostgreSQL Materialized View Solution
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

Run the system in Docker containers using the supplied `docker-compose.yml` file. Wait for the tests to pass. It takes several minutes. The creation of the test database takes most of that time. 

Please note the `pgadmin` container. It will make it easier for you to explore the database and experiment with it. Use the `localhost:8080/` endpoint to access the utility.

After a successful start of the system, you can view information about all rooms at `localhost:8000/rooms/`. Also, it shows all the objects associated with the room. You can request information about individual rooms by their IDs, e.g., `localhost:8000/rooms/311/`. 

If you use the `localhost:8000/rooms/` endpoint, the system each time rebuilds all the data about the associated objects. The test database is small, so these queries are reasonably fast. In practice, they can be extremely slow and annoying for users. They can be optimized using a PostgreSQL materialized view or other methods.

The `localhost:8000/rooms_mat_view/` endpoint returns the same information from the cache in the PostgreSQL materialized view. You can test the speed of query execution. One of the following sections describes how to do that. If you run the tests, you will see that this endpoint works much faster.

## The SQL Query That Creates the PostgreSQL Materialized View

The database schema is quite complex, similar to those encountered in practice. We can easily prepare complex queries to retrieve data from the database using the standard Django REST framework tools. See the `app/rooms/serializers.py` file as an example. 

Achieving the same result with pure SQL code can be difficult. However, in some cases, speeding up queries execution may justify the effort. It depends on the relative frequency of requests to read and modify the data.

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
1. To obtain the data from the many-to-many relationship, we use the aggregation function `jsonb_agg`. We cannot utilize this function multiple times in a row. So we have to generate several rather small WITH statements. For example, the statements `chairs_in_room_by_id` and `tables_in_room_by_id` cannot be combined. 
1. It is desirable to create an index of the view. Otherwise, it will not be possible to update the view asynchronously (CONCURRENTLY). To create an index, we run the query `CREATE UNIQUE INDEX ON rooms_related_objects (id)`.
1. Unless you have a good reason to use the regular JSON, use the binary JSON. In other words, use the `jsonb_build_object` function instead of the `json_build_object` function. Otherwise, the `TypeError: JSON object must be str, bytes or bytearray, not dict` may occur, and you will have to tinker to get rid of it.

You can explore the `rooms_related_objects` materialized view directly in the database using the `pgadmin` utility. The SQL code listed above is automatically executed during the initial database migration. See the file `app/rooms/migrations/0004_roomsrelatedobjects.py` for details.

## Using Django Signals to Automatically Update the View
The SQL code `REFRESH MATERIALIZED VIEW CONCURRENTLY rooms_related_objects;` is automatically executed whenever data in the database changes. The Django signals `post_save` and `m2m_changed` are used for that. Here is the code from the file `app/rooms/signals.py`. 

```python
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
```

Also, in the file `app/rooms/apps.py` we instruct the system that that the signals have to be processed.

```python
from django.apps import AppConfig


class RoomsConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'rooms'

    def ready(self):
        import rooms.signals
```

Below you will learn how to test the functioning of the signals.

## Creating a Django Model from the PostgreSQL Materialized View

Our goal is to acquire the cached data from the PostgreSQL materialized view instead of re-executing heavy SQL queries. To accomplish that, we have to create one more Django model. It will work with the materialized view as with a regular database table, except for minor details.

We don't have to build that model manually. To create models based on existing database tables, Django has a utility `inspectdb`. By default, it does not work with views. It needs to get the name of the view as a parameter. Save the results of its work by redirecting them to some file.

You will probably need to make small changes manually in the resulting code. In particular, indicate that the `id` field is the primary key. In the end, you get something like the following model.

```python
class RoomsRelatedObjects(models.Model):
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
```

The property `managed = False` is essential in this case. It instructs Django not to try to create a table in the database.

You can create the PostgreSQL materialized view directly in the database by executing the SQL code using the `pgadmin` utility. It is probably the best way. Or add the SQL code to the migration file. It will instruct Django to create the materialized view during the execution of the `migrate` command. You can find an example of that in the `app/rooms/migrations/0004_roomsrelatedobjects.py` file.

To use the newly created model, we have to build its serializer and view. Also, register the view in the `urls.py` file. See the code of the classes `RoomsRelatedObjectsSerializer` and `RoomsRelatedObjectsViewSet`. There is nothing special about them. Note that the `RoomsRelatedObjectsViewSet` class is a `ReadOnlyModelViewSet` class inheritor, and not a `ModelViewSet` inheritor.

## Testing the Optimization Effect
You can get the rooms' data using the PostgreSQL materialized view at the address `localhost:8000/rooms_mat_view/`. You can see the complete data about all rooms at once. Also, try to request data about individual rooms using their IDs. Make sure the data matches the one at the address `localhost:8000/rooms/`. 

The `rooms` app has a simple middleware that logs all requests. It lives in the `app/rooms/middleware/log_execution_time.py` file. 

```python
import time
import logging

logger = logging.getLogger(__name__)


class ExecutionTimeLogMiddleware:

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        start_time = time.time()
        response = self.get_response(request)
        end_time = time.time()
        time_diff = end_time - start_time
        logger.info(msg=str(";" + request.get_full_path()) +
                    ";" + str(time_diff))
        return response
```

The logs contain the paths as well as the execution time. They are in a file `logs_all_here.log`.

The `supplementary_scripts` folder contains the file `make_requests_to_log_time.py`. This script works as follows:
1. It connects to the database and gets a list of all the rooms IDs.
1. On each iteration of the loop, using that list, it makes a pair of requests to random rooms in the usual way and through the PostgreSQL materialized view. The logs of these requests are stored in a file.
1. You can change the number of request pairs by modifying the `requests_count` variable. Its default value is 20.

Run the `make_requests_to_log_time.py` script. Then find the `logs_all_here.log` file and copy it to the `supplementary_scripts` folder. It is advisable to remove lines from the log file that are not relevant. 

After that, run the second script `process_logs.py`. Pass the name of the log file as a parameter. This script splits the entries in the log file into two groups and calculates the average execution time for each of them. As an output, you will hopefully get something like the following.

![log processing output](/misc/log_processing_output.png)

When using the PostgreSQL materialized view, the mean query execution time decreases significantly. In real-world conditions, the difference is even more substantial.

## Alternative Solution

The PostgreSQL materialized view solution has a serious problem. Every time it receives a `post_save` or `m2m_changed` signal, it rebuilds all the fields for all rooms. It is redundant. 

Only some rooms are associated with the changed object. It is enough to rebuild the data on them. A real-world database may contain millions of rooms. So the inefficiency may waste significant resources.

To solve the assignment effectively, I have created one more model. It is called `RoomWithRelatedObjsRebuildInApp`. It is very similar to the `RoomsRelatedObjectsMaterializedView` model. However, it is fully controlled by Django. It has a default `managed = True` property.

In the `app/rooms/signals.py` file, you can find several functions that update the fields of instances of this model as needed. For example, the `@receiver(post_save, sender=Bed)` signal is generated when the bed changes. It triggers the corresponding function. First, that function gets a list of IDs for all the rooms related to that bed. Then it rebuilds the `beds` field in `RoomWithRelatedObjsRebuildInApp` model instances that have IDs from the list.

The `m2m_changed` signal is also processed. For example, the `@receiver(m2m_changed, sender=Decoration.souvenirs.through)` signal triggers the `decoration_souvenir_m2m_changed_update_related_rooms` function. 

Such an approach is flexible. Also, it helps save computing resources. Although, it required the developer to write and maintain more functions. Some of those functions are complicated because the database schema is bloated. However, the alternative is to write pure SQL code, which is not an easy task either.

You can use a PostgreSQL materialized view if you don't need to recalculate its data immediately after one of its related objects changes. This solution may be suitable if the requirements for the freshness of the cached data are not very strict. Perhaps in your case, it is enough to update the materialized view, for example, once a day or once a week.

Perhaps you have strict requirements for the freshness of cached data. The boss says that the cached data must be 100% up to date at all times. In such a case, use the alternative solution described in this section. You can find examples of the functions that process signals in the `app/rooms/signals.py` file.
 
## Testing the Django Signals

The PostgreSQL materialized view should be updated automatically every time the data in the database changes. The Django signals `post_save` and `m2m_changed` are used for that, as described above. The project contains several `pytest` tests. Also, you can manually check the functioning of the signals. 

To test manually, update the names of some souvenirs or tables in the browser. Use the endpoint `localhost:8000/souvenirs/` or `localhost:8000/tables/` to send the PUT or PATCH requests. After that, ensure that the information on the rooms at the `localhost:8000/rooms_mat_view/` and `localhost:8000/rooms_v2/` endpoints has also been updated.