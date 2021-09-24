from django.db import models


class Match(models.Model):
    description = models.CharField(max_length=255)
    latitude = models.FloatField(null=True, blank=True)
    longitude = models.FloatField(null=True, blank=True)
    sport = models.CharField(max_length=255)
    address = models.CharField(max_length=255, default='')
    date = models.DateTimeField()
    public = models.BooleanField(default=False)
    max_members = models.IntegerField()
    users = models.ManyToManyField('CustomUser')
    owner = models.ForeignKey('CustomUser', on_delete=models.DO_NOTHING, related_name='owner')
    team = models.ForeignKey('Team', null=True, blank=True, on_delete=models.DO_NOTHING)
