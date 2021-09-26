from backend.api.auth.auth_viewset import LoginRequiredModelViewSet
from backend.models.custom_user import CustomUser
from backend.serializers import UserSerializer


class UserViewSet(LoginRequiredModelViewSet):
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer


