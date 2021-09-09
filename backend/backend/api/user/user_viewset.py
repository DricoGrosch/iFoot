from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK, HTTP_400_BAD_REQUEST
from rest_framework.views import APIView

from backend.api.auth.auth_viewset import LoginRequiredModelViewSet
from backend.models.custom_user import CustomUser
from backend.serializers import UserSerializer


class UserViewSet(LoginRequiredModelViewSet):
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer


class UserRegisterAPIView(APIView):
    def post(self, *args, **kwargs):
        try:
            user, _ = CustomUser.objects.get_or_create(username=self.request.data['username'])
            user.set_password(self.request.data['password'])
            user.save()
            return Response({}, status=HTTP_200_OK)
        except Exception as e:
            return Response('falha', status=HTTP_400_BAD_REQUEST)
