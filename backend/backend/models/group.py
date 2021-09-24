from django.contrib.auth.models import Group
from django.db import models


class Team(Group):
    image = models.ImageField(null=True, blank=True)
    description = models.CharField(max_length=255)
