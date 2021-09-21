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
        print(self.request.user.groups.all())
        self.request.user.groups.add(Group.objects.get(id=response.data['id']))
        print(self.request.user.groups.all())
        return response
