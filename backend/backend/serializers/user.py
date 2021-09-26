from rest_framework.serializers import ModelSerializer

from backend.models import CustomUser


class UserSerializer(ModelSerializer):
    class Meta:
        model = CustomUser
        fields = '__all__'
        extra_kwargs = {'password': {'required': False}}
