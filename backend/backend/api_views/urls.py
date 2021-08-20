from django.urls import include, path
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.routers import DefaultRouter

from backend.api_views import *
from backend.api_views.user.user_viewset import UserRegisterAPIView

router = DefaultRouter()
router.register('user', UserViewSet)
router.register('match', MatchViewSet)
urlpatterns = [
    path('', include(router.urls)),
    path('login', CustomObtainAuthToken.as_view()),
    path('match/subscribe', MatchSubscribe.as_view()),
    path('match/unsubscribe', MatchUnsubscribe.as_view()),
    path('user/register',  UserRegisterAPIView.as_view())
]
