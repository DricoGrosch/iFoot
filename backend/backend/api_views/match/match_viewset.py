from backend.api_views.auth.auth_viewset import LoginRequiredModelViewSet
from backend.models import Match
from backend.serializers import MatchSerializer


class MatchViewSet(LoginRequiredModelViewSet):
    queryset = Match.objects.all()
    serializer_class = MatchSerializer
