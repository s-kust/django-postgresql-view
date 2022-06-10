from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models


class CommonInfo(models.Model):
    name = models.CharField(max_length=30, unique=True)
    width = models.FloatField(validators=[MinValueValidator(1.0), MaxValueValidator(100.0)], default=1.0)
    length = models.FloatField(validators=[MinValueValidator(1.0), MaxValueValidator(100.0)], default=1.0)
    height = models.FloatField(validators=[MinValueValidator(1.0), MaxValueValidator(100.0)], default=1.0)

    class Meta:
        abstract = True
