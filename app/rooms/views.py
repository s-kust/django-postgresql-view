from django.shortcuts import render
from rest_framework import viewsets

from rooms.serializers import WindowSerializer, RoomSerializer, RoomsRelatedObjectsSerializer, SouvenirSerializer, TableSerializer
from rooms.models import Window, Room, RoomsRelatedObjects, Souvenir, Table


class WindowViewSet(viewsets.ModelViewSet):
    serializer_class = WindowSerializer

    def get_queryset(self):
        qs = Window.objects.all()
        qs = self.serializer_class.setup_eager_loading(qs)
        return qs


class RoomViewSet(viewsets.ModelViewSet):
    serializer_class = RoomSerializer

    def get_queryset(self):
        qs = Room.objects.all()
        qs = self.serializer_class.setup_eager_loading(qs)
        return qs


class RoomsRelatedObjectsViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = RoomsRelatedObjectsSerializer
    queryset = RoomsRelatedObjects.objects.all()

# The following classes are to test
# if the post_save signal works,
# i.e. PostgreSQL view is updated automatically
# after the model instance changes


class SouvenirViewSet(viewsets.ModelViewSet):
    serializer_class = SouvenirSerializer
    queryset = Souvenir.objects.all()


class TableViewSet(viewsets.ModelViewSet):
    serializer_class = TableSerializer
    queryset = Table.objects.all()
