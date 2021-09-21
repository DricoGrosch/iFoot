from rest_framework.serializers import ModelSerializer

from backend.models import Match
from backend.serializers.group import GroupSerializer
from backend.serializers.user import UserSerializer


class MatchSerializer(ModelSerializer):
    users = UserSerializer(many=True, read_only=True)

    class Meta:
        model = Match
        fields = '__all__'

class MatchDetailSerializer(ModelSerializer):
    users = UserSerializer(many=True, read_only=True)
    group = GroupSerializer(read_only=True)

    class Meta:
        model = Match
        fields = '__all__'


class MatchShortSerializer(ModelSerializer):
    group = GroupSerializer(read_only=True)

    class Meta:
        model = Match
        fields = ['id', 'description', 'date', 'max_members', 'sport', 'group', 'public', 'address']
