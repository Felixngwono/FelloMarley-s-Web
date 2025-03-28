# Generated by Django 3.2.16 on 2025-03-03 09:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('StoryTeller', '0008_donation_faq_job_testimonial_volunteer'),
    ]

    operations = [
        migrations.AddField(
            model_name='blogpost',
            name='author',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='StoryTeller.myuser'),
        ),
        migrations.AddField(
            model_name='blogpost',
            name='status',
            field=models.CharField(choices=[('drafted', 'drafted'), ('published', 'published')], max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='event',
            name='end_date',
            field=models.DateTimeField(null=True),
        ),
        migrations.AddField(
            model_name='event',
            name='start_date',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
        migrations.AddField(
            model_name='support',
            name='resolution_notes',
            field=models.CharField(choices=[('pending', 'pending'), ('resolved', 'resolved'), ('drafted', 'drafted')], max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='task',
            name='priority',
            field=models.CharField(choices=[('low', 'low'), ('medium', 'medium'), ('high', 'high'), ('urgent', 'Urgent')], max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='task',
            name='progress_percentage',
            field=models.IntegerField(default=50),
        ),
    ]
