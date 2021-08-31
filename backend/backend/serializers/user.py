from django.contrib.auth.models import User
from rest_framework.serializers import ModelSerializer

from backend.serializers.group import GroupSerializer


class UserSerializer(ModelSerializer):
    groups = GroupSerializer(many=True,read_only=True)

    def create(self, validated_data):
        user = super(UserSerializer, self).create(validated_data)
        user.set_password(validated_data.get('password'))
        user.save()
        return user

    class Meta:
        model = User
        fields = '__all__'
        extra_kwargs = {'password': {'required': False}}
