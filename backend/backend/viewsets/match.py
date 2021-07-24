from rest_framework.viewsets import ModelViewSet

from backend.models import Match
from backend.serializers import MatchSerializer


class MatchViewSet(ModelViewSet):
    queryset = Match.objects.all()
    serializer_class = MatchSerializer
