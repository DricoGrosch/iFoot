from rest_framework.serializers import ModelSerializer

from backend.models import Match
from backend.serializers.user import UserSerializer


class MatchSerializer(ModelSerializer):
    users = UserSerializer(many=True, read_only=True)

    class Meta:
        model = Match
        fields = '__all__'


class MatchShortSerializer(ModelSerializer):
    class Meta:
        model = Match
        fields = ['id', 'location', 'date', 'number_of_members', 'sport']
