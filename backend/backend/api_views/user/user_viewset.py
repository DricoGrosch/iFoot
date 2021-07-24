from django.contrib.auth.models import User

from backend.api_views.auth.auth_viewset import LoginRequiredModelViewSet
from backend.serializers import UserSerializer


class UserViewSet(LoginRequiredModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
