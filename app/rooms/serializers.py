import logging

from rest_framework import serializers

from rooms.models import (Bed, Chair, Decoration, Door, Room,
                          RoomsRelatedObjectsMaterializedView,
                          RoomWithRelatedObjsRebuildInApp, Souvenir, Table,
                          Window, WindowFittings)

logger = logging.getLogger(__name__)


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
        extra_kwargs = {
            'id': {'read_only': False},
            'name': {'validators': []},
        }


class WindowSerializer(serializers.ModelSerializer, EagerLoadingMixin):
    fittings = WindowFittingsSerializer(many=True, read_only=True)
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
        extra_kwargs = {
            'id': {'read_only': False},
            'name': {'validators': []},
        }


class DecorationSerializer(serializers.ModelSerializer, EagerLoadingMixin):
    souvenirs = SouvenirSerializer(many=True)
    select_related_fields = ()
    prefetch_related_fields = ('souvenirs',)

    def get_or_create_souvenirs(self, souvenirs):
        logger.info(msg="; DecorationSerializer get_or_create_souvenirs...")
        souvenir_ids = []
        for souvenir in souvenirs:
            souvenir_instance, created = Souvenir.objects.get_or_create(
                pk=souvenir.get('id'), defaults=souvenir)
            souvenir_ids.append(souvenir_instance.pk)
        return souvenir_ids

    def create_or_update_souvenirs(self, souvenirs):
        logger.info(msg="; DecorationSerializer create_or_update_souvenirs...")
        souvenir_ids = []
        for souvenir in souvenirs:
            souvenir_instance, created = Souvenir.objects.update_or_create(
                pk=souvenir.get('id'), defaults=souvenir)
            souvenir_ids.append(souvenir_instance.pk)
        return souvenir_ids

    def create(self, validated_data):
        logger.info(msg="; DecorationSerializer create...")
        souvenirs = validated_data.pop('souvenirs', [])
        decoration = Decoration.objects.create(**validated_data)
        decoration.souvenirs.set(self.get_or_create_souvenirs(souvenirs))
        return decoration

    def update(self, instance, validated_data):
        logger.info(msg="; DecorationSerializer update...")
        souvenirs = validated_data.pop('souvenirs', [])
        instance.souvenirs.set(self.create_or_update_souvenirs(souvenirs))
        fields = ['name']
        for field in fields:
            try:
                setattr(instance, field, validated_data[field])
            except KeyError:  # validated_data may not contain all fields during HTTP PATCH
                pass
        instance.save()
        return instance

    class Meta:
        model = Decoration
        fields = ('__all__')


class RoomSerializer(serializers.ModelSerializer, EagerLoadingMixin):
    door = DoorSerializer(many=False, read_only=True)
    decoration = DecorationSerializer(many=False, read_only=True)
    windows = WindowSerializer(many=True, read_only=True)
    chairs = ChairSerializer(many=True, read_only=True)
    beds = BedSerializer(many=True, read_only=True)
    tables = TableSerializer(many=True, read_only=True)
    select_related_fields = ('door', 'decoration')
    prefetch_related_fields = ('windows', 'chairs', 'beds', 'tables',)

    class Meta:
        model = Room
        fields = ('__all__')


class RoomsRelatedObjectsSerializer(serializers.ModelSerializer):

    class Meta:
        model = RoomsRelatedObjectsMaterializedView
        fields = ('__all__')


class RoomsRelatedV2Serializer(serializers.ModelSerializer):

    class Meta:
        model = RoomWithRelatedObjsRebuildInApp
        fields = ('__all__')
