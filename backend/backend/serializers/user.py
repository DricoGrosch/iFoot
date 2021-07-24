from django.contrib.auth.models import User
from rest_framework.serializers import ModelSerializer


class UserSerializer(ModelSerializer):
    def create(self, validated_data):
        user = super(UserSerializer, self).create(validated_data)
        user.set_password(validated_data.get('password'))
        user.save()
        return user
    # def update(self, instance, validated_data):
    #     password = validated_data

    class Meta:
        model = User
        fields = '__all__'
        extra_kwargs={'password':{'required':False}}
