from itertools import count
from turtle import title
from django.contrib.admin.templatetags.admin_modify import register
from django.http import HttpResponse, JsonResponse
from django.shortcuts import redirect, render
from django.http import HttpResponse
from django.contrib.auth import authenticate, login as auth_login, logout
from django.contrib import messages
from urllib3 import request
from django.contrib.auth.forms import UserCreationForm
from StoryTeller.models import BlogPost, PortfolioItem, MyUser, contact,Event
from .forms import ActivityForm, BlogPostForm, BlogPostForm, EducationLevelForm, EventCategoryForm, FAQForm, ImageGalleryForm, MessageForm, NewsletterForm, NotificationForm, TaskForm, TestimonialForm, VolunteerForm, eventlocationForm, eventsForm, MyUserCreationForm, PortfolioForm, ContactusForm, SiblingForm, eventsForm
from django.contrib.auth.decorators import login_required


# Create your views here.

def me(request):
    return render(request,'home.html')

@login_required
def index(request):
    eventhappening = Event.objects.filter(title='Title').order_by('-date')[:1]  # Get the most recent event (modify based on your date field)
    users = MyUser.objects.all()
    user_count = MyUser.objects.count()
    sibling_count = Sibling.objects.count()
    Portfolio_count = PortfolioItem.objects.count()
    blog_count=BlogPost.objects.count()
    event_count = Event.objects.count()
    portfolios=PortfolioItem.objects.all().values('title','date_created')
    events=Event.objects.all().values('title','description','date').order_by('-date')
    siblings = Sibling.objects.all().values('name', 'age') 
    context = {
        'events': eventhappening,
        'users': users,
        'user_count': user_count,
        'sibling_count': sibling_count,
        'Portfolio_count': Portfolio_count,
        'event_count': event_count,
        'blog_count':blog_count,
        'events':events,
        'siblings':siblings,
        'portfolios':portfolios
    }
    return render(request, 'index.html', context)


def user_details(request, user_id):
    # Get the user object by ID
    user = get_object_or_404(MyUser, pk=user_id)
    
    # Pass the user object to the template
    return render(request, 'user_details.html', {'user': user})

def loginpage(request):
    user = None  # Initialize user variable
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)
        if user is not None:
            auth_login(request, user)             
             # Use the aliased auth_login function
            return redirect('index')  # Redirect to the appropriate page
        else:
            messages.info(request, 'Username or password is incorrect')

    context = {'user': user}
    return render(request, 'login.html', context)


def logoutuser(request):
    logout(request)
    messages.info(request,"Its sad to see you leave, welcome again " )
    return redirect('login') 



def signup(request):
    form = MyUserCreationForm()
    if request.method == 'POST':
        form = MyUserCreationForm(request.POST, request.FILES)
        if form.is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data["password1"])  # This hashes the password
            user.save()  # Save the user
            messages.info(request, 'Registration successful, login to continue to main page')
            return redirect('login')  # Redirect to login page
        else:
            messages.warning(request, 'An error occurred during registration')
    
    return render(request, 'signup.html', {'form': form})

@login_required
def blog(request):
    blogs=BlogPost.objects.all()
    context={ 'blogs':blogs }
    return render(request, 'blogpost.html', context)

def blog_details(request,pk):
    detailedblog=BlogPost.objects.get(id=pk)
    context={'detailedblog':detailedblog}
    return render(request, 'blog_details.html', context)


def add_blog(request):
    form = BlogPostForm()
    if request.method=='POST':
        form=BlogPostForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('blog')
    context={'form': form}
    return render(request, 'add_blog.html', context)

# View to update an existing blog post
def update_blog(request, pk):
    blog =get_object_or_404(BlogPost,id=pk)
    
    if request.method == 'POST':
        form = BlogPostForm(request.POST, request.FILES, instance=blog)
        if form.is_valid():
            form.save()  # Save the updated blog post
            messages.success(request, "Blog post updated successfully!")
            return redirect('blog')  # Redirect to the updated blog post detail
    else:
        form = BlogPostForm(instance=blog)
    return render(request, 'update_blog.html', {'form': form, 'blog': blog})

def delete_blog(request,pk):
    b=BlogPost.objects.get(pk=pk)
    form=BlogPostForm()
    if request.method=='POST':
        form=BlogPostForm(request.POST,instance=b)
        b.delete()
        messages.success(request,'BlogPost Deleted successfully')
        return redirect('blog')
    context={'b':b,'form':form}
    return render(request,'deleteblog.html',context)

@login_required
def Portfolio(request):
    portfolios=PortfolioItem.objects.all()
    context={ 'portfolios':portfolios }
    return render(request, 'portfoliopost.html', context)

def portfolio_details(request,pk):
    detailedportfolio=PortfolioItem.objects.get(id=pk)
    context={'detailedportfolio':detailedportfolio}
    return render(request,'detailed_portfolio.html',context)

@login_required
def add_portfolio(request):
    form=PortfolioForm()
    if request.method=='POST':
        form=PortfolioForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('portfolio')
    context={'form':form}
    return render(request, 'add_portfolio.html',context)

def update_portfolio(request, pk):
    # Retrieve the PortfolioItem using the primary key (pk)
    portfolio_item = get_object_or_404(PortfolioItem, pk=pk)

    if request.method == 'POST':
        # Handle form submission
        form = PortfolioForm(request.POST, request.FILES, instance=portfolio_item)
        if form.is_valid():
            form.save()  # Save the updated portfolio item
            messages.success(request, "Portfolio item updated successfully!")  # Show success message

            return redirect('portfolio')  # Redirect to the portfolio detail page
    else:
        form = PortfolioForm(instance=portfolio_item)

    return render(request, 'update_portfolio.html', {'form': form, 'portfolio_item': portfolio_item})


def delete_portfolio(request, pk):
    portfolio = PortfolioItem.objects.get(id=pk)
    form=PortfolioForm()

    if request.method == "POST":
        portfolio.delete()
        messages.success(request, "Portfolio deleted successfully!")
        return redirect('portfolio')  # Redirect back to the projects list
    context={'form':form,'portfolio': portfolio}
    return render(request,'delete_portfolio_confirm.html', context)  # Ensure user lands on confirm page

@login_required
def ContactusPage(request):
    form = ContactusForm()
    
    if request.method == 'POST':
            form = ContactusForm(request.POST)
            if form.is_valid():
                form.save()
                return redirect('index')     
    context={'form':form}
    return render(request, 'contact_us.html',context)

@login_required
def eventsItem(request):
    events = Event.objects.all() 
    context = {'events': events}  # Use 'events' in both view and template
    return render(request, 'events.html', context)

def event_details(request,pk):
    eventdetails=Event.objects.get(id=pk)
    context={'eventdetails':eventdetails}
    return render(request,'event_details.html',context)

def add_event(request):
    form = eventsForm()
    if request.method=='POST':
            form=eventsForm(request.POST, request.FILES)
            if form.is_valid():
                form.save()
                return redirect('events')
    context={'form':form}

    return render(request, 'event_upload.html', context)

def event_category_list(request):

    form = EventCategoryForm()
    if request.method=='POST':
            form=EventCategoryForm(request.POST,request.FILES)
            if form.is_valid():
                form.save()
                return redirect('add_event')
    context={'form':form}
    return render(request, 'event_category_list.html', context)

def event_category_detail(request, category_id):
    category = get_object_or_404(EventCategory, id=category_id)

    return render(request, 'event_category_detail.html', {'category': category})

def event_location_list(request):
    form = eventlocationForm()
    if request.method=='POST':
            form=eventlocationForm(request.POST,request.FILES)
            if form.is_valid():
                form.save()
                return redirect('add_event')
    context={'form':form}
    return render(request, 'event_location_list.html', context)

def event_location_detail(request, location_id):
    location = get_object_or_404(EventLocation, id=location_id)
    return render(request, 'event_location_detail.html', {'location': location})

@login_required
def update_event(request, pk):
    event = get_object_or_404(Event, pk=pk)  # Get the event with the given primary key (pk)

    if request.method == 'POST':  # If the form is submitted
        form = eventsForm(request.POST, request.FILES, instance=event)  # Bind the form with the data and existing event instance
        if form.is_valid():  # If the form is valid
            form.save()  # Save the updated event
            messages.success(request, "Event updated successfully!")  # Show success message
            return redirect('events')  # Redirect to the event list page (change to your desired redirect location)
    else:
        form = eventsForm(instance=event)  # If it's a GET request, pre-populate the form with the existing event data

    return render(request, 'update_event.html', {'form': form, 'event': event})

def delete_event(request,pk):
    e=Event.objects.get(id=pk)
    form=eventsForm()
    if request.method=='POST':
        form=eventsForm(request.POST,instance=e)
        e.delete()
        messages.success(request,'Event deleted Successfully')
        return redirect('events')
    context={'form':form}
    return render(request, 'delete_event.html', context)

@login_required
def about(request):
    return render(request,'about.html')

@login_required
def gallery_view(request):
    # Fetch all images from the database
    images = ImageGallery.objects.all()
    return render(request, 'gallery.html', {'images': images})

def add_image(request):
    if request.method == 'POST':
        form = ImageGalleryForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('gallery')  
    else:
        form = ImageGalleryForm()
    
    return render(request, 'add_image.html', {'form': form})

def delete_image(request,pk):
    image=ImageGallery.objects.get(id=pk)
    form=ImageGalleryForm()
    if request.method=='POST':
        form=ImageGalleryForm(request.POST,instance=image)
        image.delete()
        messages.success(request,'Image deleted Successfully')
        return redirect('gallery')
    context={'form':form,
             'image':image}
    return render(request, 'delete_image.html', context)

@login_required
def AdminsDashboard(request):
    contactinfo=contact.objects.all()
    userinfo=MyUser.objects.all()
    eventinfo=Event.objects.all()
    context={'contactinfo':contactinfo,
             'userinfo':userinfo,
             'eventinfo':eventinfo}

    return render(request,'admins.html',context)


def contact_detail(request, pk):
    contacts = contact.objects.get(id=pk)
    return render(request, 'contact_detail.html', {'contacts': contacts})

def user_detail(request, pk):
    user = get_object_or_404(MyUser, id=pk)
    return render(request, 'user_detail.html', {'user': user})


from django.shortcuts import render, get_object_or_404
from .models import Activity, EducationLevel, EventCategory, EventLocation, ImageGallery, Notification, Sibling, Task, Testimonial, Volunteer


@login_required
def siblings_list(request):
    siblings = Sibling.objects.all()
    return render(request, 'siblings_list.html', {'siblings': siblings})


@login_required
def sibling_detail(request, sibling_id):
    sibling = get_object_or_404(Sibling, id=sibling_id)
    return render(request, 'sibling_detail.html', {'sibling': sibling})




def education_journey(request):
    # Fetch all education levels
    education_levels = EducationLevel.objects.all()
    return render(request, 'education_journey.html', {'education_levels': education_levels})

@login_required
def education_level(request):
    form=EducationLevelForm()
    if request.method=='POST':
        form=EducationLevelForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request,"You've successfully added your Education details")
            return redirect('education_journey')
    context={'form':form}
    return render(request,'education_level.html',context)

# views.py
from django.shortcuts import render, get_object_or_404, redirect
from .models import EducationLevel
from .forms import EducationLevelForm

def update_education(request, education_id):
    # Get the education object by ID or return 404 if not found
    education = get_object_or_404(EducationLevel, pk=education_id)

    # If the form is submitted
    if request.method == 'POST':
        form = EducationLevelForm(request.POST, request.FILES, instance=education)
        if form.is_valid():
            form.save()
            # Redirect to a page that shows updated information
            return redirect('education_journey')
    else:
        # If it's a GET request, pre-fill the form with the existing data
        form = EducationLevelForm(instance=education)

    return render(request, 'update_education.html', {'form': form, 'education': education})

@login_required
def dashboard(request):
    return render(request,'dashboard.html')

@login_required
def add_family(request):
    form = SiblingForm()
    if request.method == 'POST':
        form = SiblingForm(request.POST,request.FILES)
        if form.is_valid():
            form.save()
            return redirect('siblings_list')     
    context={'form':form}
    return render(request, 'add_family.html',context)

from django.shortcuts import render, get_object_or_404, redirect
from .models import Sibling
from .forms import SiblingForm
from django.contrib import messages

@login_required
def update_member(request, member_id):
    sibling = get_object_or_404(Sibling, id=member_id)
    
    if request.method == "POST":
        form = SiblingForm(request.POST, request.FILES, instance=sibling)
        if form.is_valid():
            form.save()
            messages.success(request, f"{sibling.name}'s details updated successfully!")
            return redirect('siblings_list')  # Redirect to the list after update
    else:
        form = SiblingForm(instance=sibling)

    return render(request, 'update_member.html', {'form': form, 'sibling': sibling})


def tasks(request):
    tasking=Task.objects.all()
    context={'tasking':tasking}
    return render(request, 'tasks.html',context)  # Adjust the template as needed

def task_details(request,pk):
    taskdetails=Task.objects.get(id=pk)
    context={'taskdetails':taskdetails}
    return render(request,'task_details.html',context)

def add_task(request):
    form=TaskForm()
    if request.method=='POST':
       form = TaskForm(request.POST)
       if form.is_valid():
        form.save()  # Save the task to the database
        messages.success(request, 'Task added successfully.')
        return redirect('tasks')  # Redirect to another page or the same page
    context={'form':form}
    return render(request,'add_task.html',context)

@login_required
def update_task(request, pk):
    task = get_object_or_404(Task, id=pk)
    
    if request.method == "POST":
        form = TaskForm(request.POST, request.FILES, instance=task)
        if form.is_valid():
            form.save()
            messages.success(request, f"{task.title}'s details updated successfully!")
            return redirect('tasks')  # Redirect to the list after update
    else:
        form = TaskForm(instance=task)

    return render(request, 'update_task.html', {'form': form, 'task': task})

def delete_task(request,pk):
    dele=Task.objects.get(id=pk)
    form=TaskForm()
    if request.method=='POST':
        form=TaskForm(request.POST, instance=dele)
        dele.delete()
        messages.success(request,'Task deleted successfully')
        return redirect('tasks')
    context={'dele':dele,'form':form}
    return render(request, 'delete_task.html',context)




# Analytics view
def analytics(request):
    return render(request, 'analytics.html')  # Adjust the template as needed

# Notifications view
def notifications(request):
    notify=Notification.objects.all()
    context={'notify':notify}
    return render(request, 'notifications.html',context)  # Adjust the template as needed

def add_notification(request):
    form=NotificationForm()
    if request.method=='POST':
        form=NotificationForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Notifications added successfully.')
            return redirect('notifications')
    context={'form':form}
    return render(request,'add_notification.html',context)




@login_required
def update_notification(request, pk):
    notifications = get_object_or_404(Notification, id=pk)
    
    if request.method == "POST":
        form = NotificationForm(request.POST, request.FILES, instance=notifications)
        if form.is_valid():
            form.save()
            messages.success(request, f"{notifications.title}'s details updated successfully!")
            return redirect('notifications')  # Redirect to the list after update
    else:
        form = NotificationForm(instance=notifications)

    return render(request, 'update_notification.html', {'form': form, 'notifications': notifications})

def delete_notifications(request,pk):
    notify=Notification.objects.get(id=pk)
    form=NotificationForm()
    if request.method=='POST':
        form=NotificationForm(request.POST, instance=notify)
        notify.delete()
        messages.success(request,'Notification deleted successfully')
        return redirect('tasks')
    context={'notify':notify,'form':form}
    return render(request, 'delete_task.html',context)
# Activities view

from django.db.models import Count, Q
from django.db.models.functions import TruncMonth
from .models import MyUser, Event, BlogPost, PortfolioItem, EducationLevel, NewsletterSubscriber

def analytics_view(request):
    # 1. **Total Users**
    total_users = MyUser.objects.count()

    # 2. **Gender Distribution**
    gender_distribution = MyUser.objects.values('gender').annotate(count=Count('id'))

    # 3. **Events Stats**
    events_by_category = Event.objects.values('category__name').annotate(count=Count('id'))
    events_by_location = Event.objects.values('location__name').annotate(count=Count('id'))

    # 4. **Blog Posts Over Time**
    blog_posts_over_time = BlogPost.objects.annotate(month=TruncMonth('created_at')) \
                                           .values('month') \
                                           .annotate(count=Count('id')) \
                                           .order_by('month')

    # 5. **Portfolio Items Over Time**
    portfolio_items_over_time = PortfolioItem.objects.annotate(month=TruncMonth('date_created')) \
                                                     .values('month') \
                                                     .annotate(count=Count('id')) \
                                                     .order_by('month')

    # 6. **Education Levels Stats**
    education_levels = EducationLevel.objects.values('level').annotate(count=Count('id'))

    # 7. **Newsletter Subscribers**
    total_subscribers = NewsletterSubscriber.objects.count()
    subscribers_over_time = NewsletterSubscriber.objects.annotate(month=TruncMonth('subscribed_at')) \
                                                         .values('month') \
                                                         .annotate(count=Count('id')) \
                                                         .order_by('month')

    # **Context to pass to template**
    context = {
        'total_users': total_users,
        'gender_distribution': gender_distribution,
        'events_by_category': events_by_category,
        'events_by_location': events_by_location,
        'blog_posts_over_time': blog_posts_over_time,
        'portfolio_items_over_time': portfolio_items_over_time,
        'education_levels': education_levels,
        'total_subscribers': total_subscribers,
        'subscribers_over_time': subscribers_over_time,
    }

    return render(request, 'analytics.html', context)




def update_image(request, image_id):
    # Get the image object to update
    image = get_object_or_404(ImageGallery, id=image_id)

    if request.method == 'POST':
        # If the form has been submitted
        form = ImageGalleryForm(request.POST, request.FILES, instance=image)
        if form.is_valid():
            # Save the form and redirect to the gallery page
            form.save()
            return redirect('gallery')  # Assuming 'gallery' is the name of the gallery page URL
    else:
        # Create a form instance with the image object
        form = ImageGalleryForm(instance=image)

    return render(request, 'update_image.html', {'form': form, 'image': image})

def messaging(request):
    
    form=MessageForm()
    if request.method=='POST':
        form=MessageForm(request.POST)
        if form.is_valid():
         form.save()
         return redirect('admins')
    context={'form':form}
    return render(request,'messaging.html',context)

@login_required
def activity_list(request):
    
    activities = Activity.objects.all()
    
    return render(request, 'activity_list.html', {'activities': activities})

def add_activity(request):
    form=ActivityForm()
    if request.method=='POST':
        form=ActivityForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request,"You've successfully added your Activity details")
            return redirect('activity_list')
    context={'form':form}
    return render(request, 'add_activity.html', context)

@login_required
def update_activity(request, pk):
    activity = get_object_or_404(Activity, id=pk)

    if request.method == 'POST':
        form = ActivityForm(request.POST, instance=activity)
        if form.is_valid():
            form.save()
            messages.success(request, "Activity updated successfully.")
            return redirect('activity_list')  # Redirect to the list of activities
    else:
        form = ActivityForm(instance=activity)

    return render(request, 'update_activity.html', {'form': form, 'activity': activity})

# Delete activity view
def delete_activity(request, pk):
    # Fetch the activity by its ID
    activity = get_object_or_404(Activity, pk=pk)

    if request.method == 'POST':
        # Handle the deletion logic
        activity.delete()
        messages.success(request, "Activity deleted successfully.")
        return redirect('activity_list')  # Redirect to the activity list after deletion

    # If it's a GET request, show the confirmation page
    return render(request, 'activity_confirm_delete.html', {'activity': activity})


def activity_detail(request, activity_id):
    activity = get_object_or_404(Activity, id=activity_id)
    return render(request, 'activity_detail.html', {'activity': activity})


def event_detail(request, event_id):
    event = get_object_or_404(Event, id=event_id)
    return render(request, 'event_detail.html', {'event': event})

def contact_details(request, contact_id):
    contdetail = get_object_or_404(contact, id=contact_id)
    return render(request, 'contact_details.html', {'contdetail': contdetail})


from django.views.decorators.csrf import csrf_exempt
from .forms import NewsletterForm

@csrf_exempt  # Allow AJAX requests without CSRF token
def subscribe_newsletter(request):
    form=NewsletterForm()
    if request.method == "POST":
        form = NewsletterForm(request.POST)
        if form.is_valid():
            form.save()
            return JsonResponse({"message": "Subscription successful!"}, status=200)
    return JsonResponse({"message": "Invalid email."}, status=400)

from .models import Skill

def skills_view(request):
    skills = Skill.objects.all()
    return render(request, 'skills.html', {'skills': skills})

from django.shortcuts import render, get_object_or_404, redirect
from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required
from .models import Certification
from .forms import CertificationForm

@login_required
def certification_list(request):
    certifications = Certification.objects.all()
    return render(request, 'certification_list.html', {'certifications': certifications})

@login_required
def certification_detail(request, pk):
    certification = get_object_or_404(Certification, pk=pk)
    return render(request, 'certification_detail.html', {'certification': certification})

@login_required
def certification_add(request):
    form = CertificationForm()
    if request.method == "POST":
        form = CertificationForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('certification_list')
   
    
    return render(request, 'certification_form.html', {'form': form})

@login_required
def certification_update(request, pk):
    certification = get_object_or_404(Certification, pk=pk)
    if request.method == "POST":
        form = CertificationForm(request.POST, request.FILES, instance=certification)
        if form.is_valid():
            form.save()
            return redirect('certification_list')
    else:
        form = CertificationForm(instance=certification)
    return render(request, 'certificate_updation.html', {'form': form})

@login_required
def certification_delete(request, pk):
    certification = get_object_or_404(Certification, pk=pk)
    if request.method == "POST":
        certification.delete()
        return redirect('certification_list')
    return render(request, 'certification_confirm_delete.html', {'certification': certification})

from .models import Project
from .forms import ProjectForm

# Display all projects
def projects_list(request):
    projects = Project.objects.all()
    return render(request, 'projects_list.html', {'projects': projects})

# View project details
def project_detail(request, project_id):
    project = get_object_or_404(Project, id=project_id)
    return render(request, 'project_detail.html', {'project': project})

# Add a new project
def add_project(request):
    if request.method == "POST":
        form = ProjectForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('projects_list')
    else:
        form = ProjectForm()
    return render(request, 'project_form.html', {'form': form})

# Edit an existing project
def edit_project(request, project_id):
    project = get_object_or_404(Project, id=project_id)
    if request.method == "POST":
        form = ProjectForm(request.POST, request.FILES, instance=project)
        if form.is_valid():
            form.save()
            return redirect('projects_list')
    else:
        form = ProjectForm(instance=project)
    return render(request, 'project_form.html', {'form': form})

# Delete a project
def delete_project(request, project_id):
    project = get_object_or_404(Project, id=project_id)
    if request.method == "POST":
        project.delete()
        return redirect('projects_list')
    return render(request, 'project_confirm_delete.html', {'project': project})

from django.http import HttpResponse
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from .models import Sibling

def download_report(request):
    # Create a PDF response with inline display
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'inline; filename="siblings_report.pdf"'  # 'inline' displays in browser

    # Create the PDF
    p = canvas.Canvas(response, pagesize=letter)
    width, height = letter
    y = height - 40  # Start from the top

    # Title
    p.setFont("Helvetica-Bold", 16)
    p.drawString(200, y, "Siblings Report")
    y -= 30  

    # Table Headers
    p.setFont("Helvetica-Bold", 12)
    p.drawString(50, y, "Name")
    p.drawString(200, y, "Age")
    p.drawString(300, y, "Occupation")
    y -= 20  

    # Fetch data
    siblings = Sibling.objects.all()

    # Add Data
    p.setFont("Helvetica", 10)
    for sibling in siblings:
        p.drawString(50, y, sibling.name)
        p.drawString(200, y, str(sibling.age) if sibling.age else "N/A")
        p.drawString(300, y, sibling.occupation if sibling.occupation else "N/A")
        y -= 20  

    # Save the PDF
    p.showPage()
    p.save()
    
    return response

from django.http import FileResponse
import io
from reportlab.lib.pagesizes import letter
from reportlab.lib import colors
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.platypus import SimpleDocTemplate, Paragraph, Table, TableStyle, Image, Spacer
from .models import PortfolioItem, Sibling, Project, Skill, Certification, Task, Notification

def generate_full_pdf(request):
    buffer = io.BytesIO()
    doc = SimpleDocTemplate(buffer, pagesize=letter)

    # Define styles
    styles = getSampleStyleSheet()
    title_style = styles['Title']
    heading_style = styles['Heading2']
    normal_style = styles['Normal']

    elements = []

    # Title
    elements.append(Paragraph("FelloMarley Foundation", title_style))
    elements.append(Spacer(1, 10))

    # ========== 1. Portfolio Items ==========
    elements.append(Paragraph("📌 Portfolio Items", heading_style))
    portfolio_data = [["Title", "Description", "Image"]]
    
    for port in PortfolioItem.objects.all():
        img_path = port.image.path if port.image else None
        img = Image(img_path, width=60, height=60) if img_path else "No Image"
        portfolio_data.append([port.title, port.description, img])
    
    table = Table(portfolio_data, colWidths=[150, 300, 100])
    table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
        ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
        ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
        ('GRID', (0, 0), (-1, -1), 1, colors.black),
    ]))
    elements.append(table)
    elements.append(Spacer(1, 15))

    # ========== 2. Sibling Information ==========
    elements.append(Paragraph("👨‍👩‍👧‍👦 Siblings", heading_style))
    sibling_data = [["Name", "Occupation", "Age", "Profile Picture"]]
    
    for sib in Sibling.objects.all():
        img_path = sib.profile_picture.path if sib.profile_picture else None
        img = Image(img_path, width=60, height=60) if img_path else "No Image"
        sibling_data.append([sib.name, sib.occupation, sib.age, img])
    
    table = Table(sibling_data, colWidths=[120, 220, 50, 100])
    table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.darkblue),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
        ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
        ('GRID', (0, 0), (-1, -1), 1, colors.black),
    ]))
    elements.append(table)
    elements.append(Spacer(1, 15))

    # ========== 3. Projects ==========
    elements.append(Paragraph("🚀 Projects", heading_style))
    project_data = [["Title", "Technologies Used", "GitHub", "Live Demo"]]
    
    for proj in Project.objects.all():
        project_data.append([proj.title, proj.technologies_used, proj.github_link or "N/A", proj.live_demo or "N/A"])
    
    table = Table(project_data, colWidths=[150, 350, 200, 300])
    table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.green),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
        ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
        ('GRID', (0, 0), (-1, -1), 1, colors.black),
    ]))
    elements.append(table)
    elements.append(Spacer(1, 15))

    # ========== 4. Skills ==========
    elements.append(Paragraph("🛠️ Skills", heading_style))
    skill_data = [["Skill Name", "Proficiency (%)"]]
    
    for skill in Skill.objects.all():
        skill_data.append([skill.name, f"{skill.proficiency}%"])
    
    table = Table(skill_data, colWidths=[200, 300])
    table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.orange),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
        ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
        ('GRID', (0, 0), (-1, -1), 1, colors.black),
    ]))
    elements.append(table)
    elements.append(Spacer(1, 15))

    # ========== 5. Certifications ==========
    elements.append(Paragraph("📜 Certifications", heading_style))
    cert_data = [["Title", "Issuer", "Date Issued", "Credential URL"]]
    
    for cert in Certification.objects.all():
        cert_data.append([cert.title, cert.issuing_organization, cert.date_issued, cert.credential_url or "N/A"])
    
    table = Table(cert_data, colWidths=[150, 150, 100, 150])
    table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.purple),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
        ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
        ('GRID', (0, 0), (-1, -1), 1, colors.black),
    ]))
    elements.append(table)
    elements.append(Spacer(1, 15))

    # ========== 6. Tasks ==========
    elements.append(Paragraph("✅ Tasks", heading_style))
    task_data = [["Title", "Due Date", "Completed"]]
    
    for task in Task.objects.all():
        task_data.append([task.title, task.due_date.strftime("%Y-%m-%d"), "Yes" if task.completed else "No"])
    
    table = Table(task_data, colWidths=[200, 100, 80])
    table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.red),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
        ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
        ('GRID', (0, 0), (-1, -1), 1, colors.black),
    ]))
    elements.append(table)
    elements.append(Spacer(1, 15))

    # ========== 7. Notifications ==========
    elements.append(Paragraph("🔔 Notifications", heading_style))
    notification_data = [["Title", "Description", "Date"]]
    
    for note in Notification.objects.all():
        notification_data.append([note.title, note.description, note.created_at.strftime("%Y-%m-%d")])
    
    table = Table(notification_data, colWidths=[150, 250, 100])
    table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.teal),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
        ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
        ('GRID', (0, 0), (-1, -1), 1, colors.black),
    ]))
    elements.append(table)

    # Build and return PDF
    doc.build(elements)
    buffer.seek(0)
    return FileResponse(buffer, as_attachment=True, filename="Full_Report.pdf")


from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from .models import Support
from .forms import SupportForm

# List all support tickets for the logged-in user
@login_required
def support(request):
    supports=Support.objects.all()
    return render(request, 'support.html',{'supports':supports})  # Adjust the template as needed

# View support ticket details
@login_required
def support_detail(request, pk):
    support = Support.objects.get(id=pk)
    return render(request, 'support_detail.html', {'support': support})

# Create a new support ticket
@login_required
def support_create(request):
    if request.method == "POST":
        form = SupportForm(request.POST, request.FILES)
        if form.is_valid():
            support = form.save(commit=False)
            support.user = request.user
            support.save()
            return redirect('support')
    else:
        form = SupportForm()
    return render(request, 'support_form.html', {'form': form})

# Update an existing support ticket
@login_required
def support_update(request, pk):
    support = get_object_or_404(Support, pk=pk, user=request.user)
    if request.method == "POST":
        form = SupportForm(request.POST, request.FILES, instance=support)
        if form.is_valid():
            form.save()
            return redirect('support')
    else:
        form = SupportForm(instance=support)
    return render(request, 'support_form.html', {'form': form})

# Delete a support ticket
@login_required
def support_delete(request, pk):
    support = get_object_or_404(Support, pk=pk, user=request.user)
    if request.method == "POST":
        support.delete()
        return redirect('support_list')
    return render(request, 'support_confirm_delete.html', {'support': support})

from django.shortcuts import render, get_object_or_404, redirect
from .models import Skill
from .forms import SkillForm

# List View
def skill_list(request):
    skills = Skill.objects.all()
    return render(request, 'skill_list.html', {'skills': skills})

# Detail View
def skill_detail(request, pk):
    skill = get_object_or_404(Skill, pk=pk)
    return render(request, 'skill_detail.html', {'skill': skill})

# Create & Update View
def skill_form(request, pk=None):
    if pk:
        skill = get_object_or_404(Skill, pk=pk)
    else:
        skill = None
    
    if request.method == "POST":
        form = SkillForm(request.POST, instance=skill)
        if form.is_valid():
            form.save()
            return redirect('skill_list')
    else:
        form = SkillForm(instance=skill)

    return render(request, 'skill_form.html', {'form': form, 'skill': skill})

# Delete View
def skill_delete(request, pk):
    skill = get_object_or_404(Skill, pk=pk)
    if request.method == "POST":
        skill.delete()
        return redirect('skill_list')
    return render(request, 'skill_confirm_delete.html', {'skill': skill})


from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from twilio.rest import Client
from .models import contact  # Assuming you have a Contact model storing user details

# Twilio Credentials (Replace with your actual credentials)
TWILIO_ACCOUNT_SID = "ACe27d35129c986ac2c3e9dcc8f9bac58d"
TWILIO_AUTH_TOKEN = "b9155b4178eb1ffc06b954afa901edb6"
TWILIO_PHONE_NUMBER = "+13203010247"  # Your Twilio phone number

def send_response(request, contact_id):
    contacts = get_object_or_404(contact, id=contact_id)
    
    if request.method == "POST":
        response_message = request.POST.get("response_message")
        
        if response_message:
            # Send SMS using Twilio
            client = Client(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
            
            try:
                message = client.messages.create(
                    body=f"Admin Response: {response_message}",
                    from_=TWILIO_PHONE_NUMBER,
                    to=contact.phone  # User's phone number
                )
                messages.success(request, "Response sent successfully via SMS!")
            except Exception as e:
                messages.error(request, f"Error sending message: {str(e)}")

        return redirect("admins")  # Redirect back to the admin page
    
    return render(request, "admins.html", {"contdetail": contacts})

from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from twilio.rest import Client
from .models import Event  # Ensure your Event model is correctly set up

# Twilio Credentials (Replace with actual credentials)
TWILIO_ACCOUNT_SID = "your_account_sid"
TWILIO_AUTH_TOKEN = "your_auth_token"
TWILIO_PHONE_NUMBER = "+1234567890"  # Your Twilio phone number

def admin_event_view(request, event_id):
    # Fetch event details from the database
    event = get_object_or_404(Event, id=event_id)
    
    return render(request, "admin_event_view.html", {"event": event})

def send_event_response(request, event_id):
    eventing = get_object_or_404(Event, id=event_id)
    
    if request.method == "POST":
        response_message = request.POST.get("response_message")

        if response_message:
            client = Client(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
            
            try:
                message = client.messages.create(
                    body=f"Admin Response: {response_message}",
                    from_=TWILIO_PHONE_NUMBER,
                    to=eventing.host_phone  # Assuming the event model has a 'host_phone' field
                )
                messages.success(request, "Response sent successfully via SMS!")
            except Exception as e:
                messages.error(request, f"Error sending message: {str(e)}")

        return redirect("admins")

    return render(request, "admin_event_view.html", {"eventing": eventing})


def testimonials_list(request):
    testimonials = Testimonial.objects.all()
    return render(request, 'testimonials_list.html', {'testimonials': testimonials})


@login_required
def add_testimonial(request):
    if request.method == "POST":
        form = TestimonialForm(request.POST, request.FILES)
        if form.is_valid():
            testimonial = form.save(commit=False)
            testimonial.user = request.user
            testimonial.save()
            return redirect('testimonials_list')
    else:
        form = TestimonialForm()
    return render(request, 'add_testimonial.html', {'form': form})


def volunteer_list(request):
    volunteers = Volunteer.objects.all()
    return render(request, 'volunteer_list.html', {'volunteers': volunteers})

def volunteer_signup(request):
    form = VolunteerForm()
    if request.method == "POST":
        form = VolunteerForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('volunteer_list') 
    return render(request, 'volunteer_signup.html', {'form': form})

from django.shortcuts import render, redirect
from .models import Job
from .forms import JobForm

def job_list(request):
    jobs = Job.objects.all()
    return render(request, 'job_list.html', {'jobs': jobs})

def post_job(request):
    if request.method == "POST":
        form = JobForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('job_list')
    else:
        form = JobForm()
    return render(request, 'post_job.html', {'form': form})

from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import DonationForm
from .models import Donation

def donate(request):
    if request.method == "POST":
        form = DonationForm(request.POST)
        if form.is_valid():
            donation = form.save()
            messages.success(request, "Thank you for your donation!")
            return redirect('donate')  # Redirect to the same page or a success page
    else:
        form = DonationForm()

    return render(request, 'donation.html', {'form': form})



from django.shortcuts import render
from .models import FAQ

def faq_list(request):
    faqs = FAQ.objects.all()
    return render(request, 'faq_list.html', {'faqs': faqs})

def add_faq(request):
    form= FAQForm()
    if request.method=='POST':
       form=FAQForm(request.POST,request.FILES)
       if form.is_valid():
           form.save()
           return redirect('faq_list')  
    return render (request,'add_faq.html',{'form':form})
    
def search(request):

    if request.method=='POST':
        searched=request.POST['searched']
        searching=BlogPost.objects.filter(title__contains=searched)
        
    context={'searched':searched,
             'searching':searching}
    return render(request,'search_item.html',context)