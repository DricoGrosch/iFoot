from rest_framework.serializers import ModelSerializer

from backend.models import Match
from backend.serializers.team import TeamSerializer
from backend.serializers.user import UserSerializer


class MatchSerializer(ModelSerializer):
    users = UserSerializer(many=True, read_only=True)

    class Meta:
        model = Match
        fields = '__all__'

class MatchDetailSerializer(ModelSerializer):
    users = UserSerializer(many=True, read_only=True)
    team = TeamSerializer(read_only=True)
    owner = UserSerializer(read_only=True)

    class Meta:
        model = Match
        fields = '__all__'


class MatchShortSerializer(ModelSerializer):
    team = TeamSerializer(read_only=True)
    owner = UserSerializer(read_only=True)

    class Meta:
        model = Match
        fields = ['id', 'description', 'date', 'max_members', 'sport', 'team', 'public', 'address','owner']
