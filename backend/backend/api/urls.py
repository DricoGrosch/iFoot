from django.urls import include, path
from rest_framework.routers import DefaultRouter

from backend.api import *

router = DefaultRouter()
router.register('user', UserViewSet)
router.register('match', MatchViewSet)
router.register('team', TeamViewSet)
urlpatterns = [
    path('', include(router.urls)),
    path('login/', CustomObtainAuthToken.as_view()),
    path('match_subscribe/', MatchSubscribe.as_view()),
    path('match_unsubscribe/', MatchUnsubscribe.as_view()),
    path('user_register/', UserRegisterAPIView.as_view()),
    path('team_image_upload/', TeamImageUpload.as_view()),
]
