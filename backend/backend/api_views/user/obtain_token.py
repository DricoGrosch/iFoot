from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.response import Response
from rest_framework.status import HTTP_401_UNAUTHORIZED

from backend.serializers import UserSerializer


class CustomObtainAuthToken(ObtainAuthToken):
    def post(self, *args, **kwargs):
        try:
            serializer = self.serializer_class(data=self.request.data, context={'request': self.request})
            serializer.is_valid(raise_exception=True)
            user = serializer.validated_data['user']
            token, created = Token.objects.get_or_create(user=user)
            return Response({
                'token': token.key,
                'user': {
                    **UserSerializer(user).data
                }
            })
        except:
            return Response({'token': None}, status=HTTP_401_UNAUTHORIZED)
