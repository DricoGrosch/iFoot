from django.contrib.auth.models import AbstractUser
from django.db import models


class CustomUser(AbstractUser):
    profile_image = models.ImageField()
    rating_average = models.IntegerField(default=0)