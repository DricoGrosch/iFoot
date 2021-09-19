from rest_framework import serializers
from rest_framework.serializers import ModelSerializer

from backend.models import CustomUser
from backend.serializers.group import GroupSerializer


class UserSerializer(ModelSerializer):
    groups = GroupSerializer(many=True,read_only=True)
    profile_image = serializers.SerializerMethodField()

    class Meta:
        model = CustomUser
        fields = '__all__'
        extra_kwargs = {'password': {'required': False}}

    def get_profile_image(self,user):
        url = None
        if user.profile_image:
            request = self.context.get('request')
            url = request.build_absolute_uri(user.profile_image.url)
        return url

    # def create(self, validated_data):
    #     user = super(UserSerializer, self).create(validated_data)
    #     user.set_password(validated_data.get('password'))
    #     user.save()
    #     return user


