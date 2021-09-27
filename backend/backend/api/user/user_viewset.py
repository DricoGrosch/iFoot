from rest_framework.response import Response

from backend.api.auth.auth_viewset import LoginRequiredModelViewSet
from backend.models.custom_user import CustomUser
from backend.serializers import UserSerializer, TeamSerializer


class UserViewSet(LoginRequiredModelViewSet):
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer
    
    
    def retrieve(self, request, *args, **kwargs):
        response = super(UserViewSet, self).retrieve(request,*args,**kwargs)
        return Response({**response.data,'teams':[TeamSerializer(t).data for t in self.request.user.team_set.all()]})


