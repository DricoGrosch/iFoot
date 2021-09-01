from django.urls import include, path
from rest_framework.routers import DefaultRouter

from backend.api import *
from backend.api.user.user_viewset import UserRegisterAPIView

router = DefaultRouter()
router.register('user', UserViewSet)
router.register('match', MatchViewSet)
router.register('group', GroupViewSet)
urlpatterns = [
    path('', include(router.urls)),
    path('login/', CustomObtainAuthToken.as_view()),
    path('match/subscribe/', MatchSubscribe.as_view()),
    path('match/unsubscribe/', MatchUnsubscribe.as_view()),
    path('user/register/',  UserRegisterAPIView.as_view())
]
