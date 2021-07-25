from backend.api_views.auth.auth_viewset import LoginRequiredModelViewSet
from backend.models import Match
from backend.serializers import *


class MatchViewSet(LoginRequiredModelViewSet):
    queryset = Match.objects.all()
    serializer_class = MatchSerializer

    def get_serializer_class(self):
        if self.action == 'list':
            return MatchShortSerializer
        return MatchSerializer
