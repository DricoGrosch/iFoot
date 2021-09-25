from rest_framework.serializers import ModelSerializer

from backend.models.team import Team


class TeamSerializer(ModelSerializer):
    class Meta:
        model = Team
        fields = '__all__'