from django.contrib.auth.models import User
from rest_framework.relations import PrimaryKeyRelatedField
from rest_framework.serializers import ModelSerializer

from backend.models import Match
from backend.serializers.user import UserSerializer


class MatchSerializer(ModelSerializer):
    users = UserSerializer(many=True,read_only=True)
    user_ids = PrimaryKeyRelatedField(
        queryset=User.objects.all(),
        many=True, write_only=True)
    def create(self, validated_data):
        users = validated_data.pop('user_ids')
        match = super(MatchSerializer, self).create(validated_data)
        match.users.add(*users)
        return match

    class Meta:
        model = Match
        fields = '__all__'
