from backend.api.auth.auth_viewset import LoginRequiredModelViewSet
from backend.models.team import Team
from backend.serializers.team import TeamSerializer


class TeamViewSet(LoginRequiredModelViewSet):
    queryset = Team.objects.none()
    serializer_class = TeamSerializer

    def get_queryset(self):
        return self.request.user.team_set.all()


    def create(self, request, *args, **kwargs):
        response = super(TeamViewSet, self).create(request, *args, **kwargs)
        Team.objects.get(id=response.data['id']).users.add(self.request.user)
        return response
