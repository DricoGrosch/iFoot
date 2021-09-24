
from backend.api.auth.auth_viewset import LoginRequiredModelViewSet
from backend.models import Group
from backend.models.group import Team
from backend.serializers.team import TeamSerializer


class TeamViewSet(LoginRequiredModelViewSet):
    queryset = Team.objects.none()
    serializer_class = TeamSerializer

    def get_queryset(self):
        teams = self.request.user.teams.all()
        return teams

    def create(self, request, *args, **kwargs):
        response = super(TeamViewSet, self).create(request, *args, **kwargs)
        self.request.user.teams.add(Team.objects.get(id=response.data['id']))
        return response
