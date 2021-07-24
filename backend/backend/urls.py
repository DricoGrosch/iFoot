from django.contrib import admin
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .viewsets import *

router = DefaultRouter()
router.register('api/users', UserViewSet)
router.register('api/matches', MatchViewSet)

urlpatterns = [
    path(r'', include(router.urls)),
    path('admin/', admin.site.urls),
]
