from django.urls import include, path
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.routers import DefaultRouter

from backend.api_views import *

router = DefaultRouter()
router.register('user', UserViewSet)
router.register('match', MatchViewSet)
urlpatterns = [
    path('', include(router.urls)),
    path('login', ObtainAuthToken.as_view()),
    path('match/assignment', MatchAssingment.as_view()),
    path('match/unassignment', MatchUnassingment.as_view())
]
