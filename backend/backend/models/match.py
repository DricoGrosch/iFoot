from django.db import models


class Match(models.Model):
    location = models.CharField(max_length=255)
    latitude = models.FloatField(null=True, blank=True)
    longitude = models.FloatField(null=True, blank=True)
    number_of_members = models.IntegerField(default=0)
    sport = models.CharField(max_length=255)
    date = models.DateTimeField()
    public = models.BooleanField(default=False)
    users = models.ManyToManyField('CustomUser')
    group = models.ForeignKey('auth.Group', null=True, blank=True, on_delete=models.DO_NOTHING)