# Generated by Django 3.2.5 on 2021-09-16 01:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backend', '0004_rename_location_match_description'),
    ]

    operations = [
        migrations.AddField(
            model_name='match',
            name='address',
            field=models.CharField(default=1, max_length=255),
            preserve_default=False,
        ),
    ]
