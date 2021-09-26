from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK

from backend.api.auth.auth_api_view import LoginRequiredApiView
from backend.models import Team
from backend.serializers import TeamSerializer


class TeamImageUpload(LoginRequiredApiView):
    def post(self, *args, **kwargs):
        team = Team.objects.get(id=self.request.data['id']);
        team.image = self.request.data['image']
        team.save()
        return Response(TeamSerializer(team, context={'request': self.request}).data, status=HTTP_200_OK)
