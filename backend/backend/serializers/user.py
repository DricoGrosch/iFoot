from rest_framework import serializers
from rest_framework.serializers import ModelSerializer

from backend.models import CustomUser
from backend.serializers.team import TeamSerializer


class UserSerializer(ModelSerializer):
    teams = TeamSerializer(many=True, read_only=True)

    class Meta:
        model = CustomUser
        fields = '__all__'
        extra_kwargs = {'password': {'required': False}}
