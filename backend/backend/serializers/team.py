from rest_framework.serializers import ModelSerializer

from backend.models.group import Team


class TeamSerializer(ModelSerializer):
    class Meta:
        model = Team
        fields = '__all__'
