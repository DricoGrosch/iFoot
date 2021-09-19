import copy

from django.db import IntegrityError
from rest_framework.authtoken.models import Token
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
            data = copy.copy(self.request.data)
            data.pop('token') if 'token' in data else None
            data.pop('password2') if 'password2' in data else None
            user,_= CustomUser.objects.get_or_create(**data)
            user.set_password(self.request.data['password'])
            user.save()
            token, created = Token.objects.get_or_create(user=user)
            return Response({**UserSerializer(user).data, 'token': token.key}, status=HTTP_200_OK)
        except IntegrityError:
            return Response({'errors':'Nome de usuário já existente'}, status=HTTP_400_BAD_REQUEST)
