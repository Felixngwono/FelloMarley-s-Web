from django.forms import ModelForm

from .models import FAQ, Activity, BlogPost, EducationLevel, ImageGallery, Notification, PortfolioItem, Sibling, Task, MyUser, Testimonial, Volunteer, contact, Event,EventCategory,EventLocation, message
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class  MyUserCreationForm(UserCreationForm):
    
    class Meta:
        model = MyUser
        fields = ['username','email','password1','password2']


class BlogPostForm(ModelForm):
    class Meta:
        model=BlogPost
        fields='__all__'
        
        
class PortfolioForm(ModelForm):
    class Meta:
        model=PortfolioItem
        fields='__all__'
        
class  ContactusForm(ModelForm):
    
    class Meta:
        model = contact
        fields = '__all__'


class eventsForm(ModelForm):
    class Meta:
        model=Event
        fields='__all__'

class EventCategoryForm(ModelForm):
    
    class Meta:
        model = EventCategory
        fields = '__all__'

class eventlocationForm(ModelForm):
    
    class Meta:
        model=EventLocation
        fields='__all__'
    

class SiblingForm(ModelForm):
    
    class Meta:
        model = Sibling
        fields = "__all__"

class EducationLevelForm(ModelForm):
    class Meta:
        model = EducationLevel
        fields = ['level', 'school', 'description', 'pdf_proof']

class EducationLevelForm(ModelForm):
    
    class Meta:
        model = EducationLevel
        fields = "__all__"

class ImageGalleryForm(ModelForm):
    class Meta:
        model = ImageGallery
        fields = ['title', 'image', 'caption']
       


class BlogForm(ModelForm):
    class Meta:
        model = BlogPost
        fields = '__all__'

class MessageForm(ModelForm):
    
    class Meta:
        model = message
        fields = '__all__'

class TaskForm(ModelForm):
    
    class Meta:
        model = Task
        fields = '__all__'

class ActivityForm(ModelForm):
    class Meta:
        model = Activity
        fields = "__all__"

class NotificationForm(ModelForm):
    class Meta:
        model = Notification
        fields = "__all__"


from .models import NewsletterSubscriber

class NewsletterForm(ModelForm):
    class Meta:
        model = NewsletterSubscriber
        fields = ['email']

from django import forms
from .models import Project

class ProjectForm(forms.ModelForm):
    class Meta:
        model = Project
        fields = '__all__'
        
from django import forms
from .models import Certification

from django import forms
from .models import Certification

class CertificationForm(forms.ModelForm):
    class Meta:
        model = Certification
        fields = ['title', 'issuing_organization', 'date_issued', 'credential_url', 'certificate_pdf','certificate_image']
        widgets = {
            'date_issued': forms.DateInput(attrs={'type': 'date'}),
        }


from django import forms
from .models import NewsletterSubscriber

class NewsletterForm(forms.ModelForm):
    class Meta:
        model = NewsletterSubscriber
        fields = ['email']

from django import forms
from .models import Support

class SupportForm(forms.ModelForm):
    class Meta:
        model = Support
        fields = ['title', 'description', 'category','user','assignee','status', 'priority', 'attachment']


from .models import Skill

class SkillForm(forms.ModelForm):
    class Meta:
        model = Skill
        fields = ['name', 'proficiency']
        widgets = {
            'proficiency': forms.NumberInput(attrs={'min': 0, 'max': 100, 'step': 1}),
        }

class TestimonialForm(forms.ModelForm):
    class Meta:
        model = Testimonial
        fields = ['name', 'designation', 'message', 'image']


class VolunteerForm(forms.ModelForm):
    class Meta:
        model = Volunteer
        fields ='__all__'

from django import forms
from .models import Job

class JobForm(forms.ModelForm):
    class Meta:
        model = Job
        fields = ['title', 'company', 'location', 'job_type', 'description', 'requirements', 'application_link']

from django import forms
from .models import Donation

class DonationForm(forms.ModelForm):
    class Meta:
        model = Donation
        fields = ['name', 'email', 'amount', 'payment_method']

class FAQForm(forms.ModelForm):
    
    class Meta:
        model = FAQ
        fields = '__all__'
