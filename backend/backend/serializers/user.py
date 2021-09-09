from rest_framework.serializers import ModelSerializer

from backend.models import CustomUser
from backend.serializers.group import GroupSerializer


class UserSerializer(ModelSerializer):
    groups = GroupSerializer(many=True,read_only=True)
    class Meta:
        model = CustomUser
        fields = '__all__'
        extra_kwargs = {'password': {'required': False}}


    def create(self, validated_data):
        user = super(UserSerializer, self).create(validated_data)
        user.set_password(validated_data.get('password'))
        user.save()
        return user


