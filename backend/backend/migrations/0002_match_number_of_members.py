# Generated by Django 3.2.5 on 2021-08-30 22:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backend', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='match',
            name='number_of_members',
            field=models.IntegerField(default=0),
        ),
    ]
