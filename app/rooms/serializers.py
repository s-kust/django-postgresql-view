from rest_framework import serializers
from rooms.models import WindowFittings, Window, Door, Souvenir, Decoration, Room, Chair, Bed, Table, RoomsRelatedObjects


class EagerLoadingMixin:
    @classmethod
    def setup_eager_loading(cls, queryset):
        """
        This function allow dynamic addition of the related objects to
        the provided query.
        @parameter param1: queryset
        """

        if hasattr(cls, "select_related_fields"):
            queryset = queryset.select_related(*cls.select_related_fields)
        if hasattr(cls, "prefetch_related_fields"):
            queryset = queryset.prefetch_related(*cls.prefetch_related_fields)
        return queryset


class WindowFittingsSerializer(serializers.ModelSerializer):

    class Meta:
        model = WindowFittings
        fields = ('__all__')


class WindowSerializer(serializers.ModelSerializer, EagerLoadingMixin):
    fittings = WindowFittingsSerializer(many=True)
    select_related_fields = ()
    # Only necessary if you have fields to prefetch
    prefetch_related_fields = ('fittings',)

    class Meta:
        model = Window
        fields = ('__all__')


class BedSerializer(serializers.ModelSerializer):

    class Meta:
        model = Bed
        fields = ('__all__')


class TableSerializer(serializers.ModelSerializer):

    class Meta:
        model = Table
        fields = ('__all__')


class ChairSerializer(serializers.ModelSerializer):

    class Meta:
        model = Chair
        fields = ('__all__')


class DoorSerializer(serializers.ModelSerializer):

    class Meta:
        model = Door
        fields = ('__all__')


class SouvenirSerializer(serializers.ModelSerializer):

    class Meta:
        model = Souvenir
        fields = ('__all__')


class DecorationSerializer(serializers.ModelSerializer, EagerLoadingMixin):
    souvenirs = SouvenirSerializer(many=True)
    select_related_fields = ()
    prefetch_related_fields = ('souvenirs',)

    class Meta:
        model = Decoration
        fields = ('__all__')


class RoomSerializer(serializers.ModelSerializer, EagerLoadingMixin):
    door = DoorSerializer(many=False)
    decoration = DecorationSerializer(many=False)
    windows = WindowSerializer(many=True)
    chairs = ChairSerializer(many=True)
    beds = BedSerializer(many=True)
    tables = TableSerializer(many=True)
    select_related_fields = ('door', 'decoration')
    prefetch_related_fields = ('windows', 'chairs', 'beds', 'tables',)

    class Meta:
        model = Room
        fields = ('__all__')


class RoomsRelatedObjectsSerializer(serializers.ModelSerializer):

    class Meta:
        model = RoomsRelatedObjects
        fields = ('__all__')
