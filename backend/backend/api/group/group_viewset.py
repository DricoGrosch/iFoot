from django.contrib.auth.models import Group

from backend.api.auth.auth_viewset import LoginRequiredModelViewSet
from backend.serializers.group import GroupSerializer


class GroupViewSet(LoginRequiredModelViewSet):
    queryset = Group.objects.none()
    serializer_class = GroupSerializer

    def get_queryset(self):
        groups = self.request.user.groups.all()
        return groups

    def create(self, request, *args, **kwargs):
        response = super(GroupViewSet, self).create(request, *args, **kwargs)
        serializer = self.get_serializer(data=request.data)
        self.request.user.groups.add(serializer.instance)
        return response
