from rest_framework.serializers import ModelSerializer

from backend.models.team import Team
from backend.serializers import UserSerializer


class TeamSerializer(ModelSerializer):
    users = UserSerializer(many=True, read_only=True)

    class Meta:
        model = Team
        fields = '__all__'
