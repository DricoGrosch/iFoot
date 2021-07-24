from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK, HTTP_500_INTERNAL_SERVER_ERROR

from backend.api_views.auth.auth_api_view import LoginRequiredApiView
from backend.models import Match


class MatchAssingment(LoginRequiredApiView):
    def post(self, *args, **kwargs):
        try:
            match_id = self.request.data['match_id']
            match = Match.objects.get(id=match_id)
            match.users.add(self.request.user)
            return Response("Success", status=HTTP_200_OK)
        except Exception as e:
            return Response(e.args[0], status=HTTP_500_INTERNAL_SERVER_ERROR)
