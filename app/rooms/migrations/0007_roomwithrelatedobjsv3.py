# Generated by Django 4.0.5 on 2022-06-09 15:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rooms', '0006_roomwithrelatedobjsrebuildinapp'),
    ]

    operations = [
        migrations.CreateModel(
            name='RoomWithRelatedObjsV3',
            fields=[
                ('id', models.BigIntegerField(primary_key=True, serialize=False)),
                ('door', models.JSONField(blank=True, null=True)),
                ('decoration', models.JSONField(blank=True, null=True)),
                ('windows', models.JSONField(blank=True, null=True)),
                ('name', models.CharField(blank=True, max_length=30, null=True)),
                ('width', models.FloatField(blank=True, null=True)),
                ('length', models.FloatField(blank=True, null=True)),
                ('height', models.FloatField(blank=True, null=True)),
                ('type', models.CharField(blank=True, max_length=5, null=True)),
                ('beds', models.JSONField(blank=True, null=True)),
                ('chairs', models.JSONField(blank=True, null=True)),
                ('tables', models.JSONField(blank=True, null=True)),
            ],
        ),
    ]
