from django.contrib.auth.models import Group
from django.db import models


class Team(models.Model):
    name = models.CharField(max_length=255)
    image = models.ImageField(null=True, blank=True)
    users = models.ManyToManyField('CustomUser')
