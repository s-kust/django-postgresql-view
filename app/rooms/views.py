from rest_framework import viewsets

from rooms.models import (Bed, Chair, Decoration, Door, Room,
                          RoomsRelatedObjectsMaterializedView,
                          RoomWithRelatedObjsRebuildInApp,
                          RoomWithRelatedObjsV3, Souvenir, Table, Window,
                          WindowFittings)
from rooms.serializers import (BedSerializer, ChairSerializer,
                               DecorationSerializer, DoorSerializer,
                               RoomSerializer, RoomsRelatedObjectsSerializer,
                               RoomsRelatedV2Serializer,
                               RoomsRelatedV3Serializer, SouvenirSerializer,
                               TableSerializer, WindowFittingsSerializer,
                               WindowSerializer)


class RoomViewSet(viewsets.ModelViewSet):
    serializer_class = RoomSerializer

    def get_queryset(self):
        qs = Room.objects.all()
        qs = self.serializer_class.setup_eager_loading(qs)
        return qs


class RoomsRelatedObjectsViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = RoomsRelatedObjectsSerializer
    queryset = RoomsRelatedObjectsMaterializedView.objects.all()


class RoomsRelatedV2ViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = RoomsRelatedV2Serializer
    queryset = RoomWithRelatedObjsRebuildInApp.objects.all()


class RoomsRelatedV3ViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = RoomsRelatedV3Serializer
    queryset = RoomWithRelatedObjsV3.objects.all()


# The following classes are to test
# if the post_save signal works,
# i.e. PostgreSQL view is updated automatically
# after the model instance changes


class WindowViewSet(viewsets.ModelViewSet):
    serializer_class = WindowSerializer

    def get_queryset(self):
        qs = Window.objects.all()
        qs = self.serializer_class.setup_eager_loading(qs)
        return qs


class SouvenirViewSet(viewsets.ModelViewSet):
    serializer_class = SouvenirSerializer
    queryset = Souvenir.objects.all()


class TableViewSet(viewsets.ModelViewSet):
    serializer_class = TableSerializer
    queryset = Table.objects.all()


class DecorationViewSet(viewsets.ModelViewSet):
    serializer_class = DecorationSerializer
    queryset = Decoration.objects.all()


class DoorViewSet(viewsets.ModelViewSet):
    serializer_class = DoorSerializer
    queryset = Door.objects.all()


class ChairViewSet(viewsets.ModelViewSet):
    serializer_class = ChairSerializer
    queryset = Chair.objects.all()


class BedViewSet(viewsets.ModelViewSet):
    serializer_class = BedSerializer
    queryset = Bed.objects.all()


class WindowFittingsViewSet(viewsets.ModelViewSet):
    serializer_class = WindowFittingsSerializer
    queryset = WindowFittings.objects.all()
