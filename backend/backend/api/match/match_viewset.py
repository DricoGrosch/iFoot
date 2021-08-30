from backend.api.auth.auth_viewset import LoginRequiredModelViewSet
from backend.models import Match
from backend.serializers import *


class MatchViewSet(LoginRequiredModelViewSet):
    serializer_class = MatchSerializer
    queryset = Match.objects.none()

    def get_queryset(self):
        qs = self.request.user.match_set.all()
        if 'other' in self.request.GET:
            ids_to_exclude = []
            for m in Match.objects.all():
                if self.request.user in m.users.all():
                    ids_to_exclude.append(m.id)
            qs = Match.objects.all().exclude(id__in=ids_to_exclude)
        return qs

    def get_serializer_class(self):
        if self.action == 'list':
            return MatchShortSerializer
        return MatchSerializer
