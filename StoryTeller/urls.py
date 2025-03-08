from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from .views import ContactusPage, activity_detail, add_faq, donate, faq_list, job_list, post_job, search,volunteer_list, volunteer_signup,  activity_list, add_activity, add_blog, add_image, add_notification, add_project, add_task, add_testimonial, blog, blog_details, certification_add, certification_delete, certification_detail, certification_list, certification_update, contact_detail, contact_details, delete_activity, delete_blog, delete_event, delete_image, delete_notifications, delete_portfolio, delete_project, delete_task, download_report, edit_project,education_level, education_journey, event_detail, event_details, generate_full_pdf, messaging, portfolio_details, project_detail, projects_list, send_event_response, send_response, skill_delete, skill_detail, skill_form, skill_list, skills_view, subscribe_newsletter, support_create, support_delete, support_detail, support_update, task_details, testimonials_list, update_activity, update_blog, update_education, update_event, update_image, update_notification, update_portfolio, update_task, user_detail, user_details, analytics,notifications, add_event, add_portfolio, dashboard,add_family,  event_category_detail, event_category_list, event_location_detail, event_location_list, me,index, sibling_detail, siblings_list,signup,loginpage,AdminsDashboard,logoutuser,Portfolio,eventsItem,gallery_view,about, support, tasks, update_member
urlpatterns = [
    path('',me,name='me' ),
    path('index/',index,name='index' ),
    
    path('search/',search,name='search' ),



    path("signup/",signup, name="signup"),
    path("login/",loginpage, name="login"),
    path("logoutuser/",logoutuser, name="logoutuser"),

    path('blog/', blog, name='blog'),  # URL for adding a new blog
    path('add/', add_blog, name='add_blog'),  # URL for adding a new blog
    path('update/<int:pk>/update/', update_blog, name='update_blog'),
    path('delete_blog/<int:pk>/delete/', delete_blog, name='delete_blog'),
    path('blog_details/<int:pk>/delete/', blog_details, name='blog_details'),

    


    path("portfolio/",Portfolio, name="portfolio"),
    path("add_portfolio/",add_portfolio, name="add_portfolio"),
    path('portfolio/<int:pk>/update/',update_portfolio, name='update_portfolio'),
    path('portfolio/<int:pk>/', delete_portfolio, name='delete_portfolio'),
    path('portfolio_details/<int:pk>/', portfolio_details, name='portfolio_details'),

    


    path("contact_us/",ContactusPage, name="contactus"),

    path("events/",eventsItem, name='events'),
    path('add_event/', add_event, name='add_event'),
    path('categories/', event_category_list, name='event_category_list'),
    path('categories/<int:category_id>/', event_category_detail, name='event_category_detail'),
    path('locations/', event_location_list, name='event_location_list'),
    path('locations/<int:location_id>/', event_location_detail, name='event_location_detail'),
    path('event/update/<int:pk>/', update_event, name='update_event'),
    path('event/delete/<int:pk>/', delete_event, name='delete_event'),
    path('event_details/update/<int:pk>/', event_details, name='event_detail'),



    path("about/", about, name="about"),

    path("gallery/", gallery_view, name="gallery"),
    path('gallery/add/', add_image, name='add_image'),
    path('update_image/<int:image_id>/', update_image, name='update_image'),
    path('delete_image/<int:pk>/', delete_image, name='delete_image'),


    path("admins/", AdminsDashboard, name="admins"),
    path('event/<int:event_id>/', event_detail, name='event_detail'),
    path('contact/<int:contact_id>/', contact_details, name='contact_details'),


    path('contact/<int:pk>/', contact_detail, name='contact_detail'),
    path('user/<int:pk>/', user_detail, name='user_detail'),
    
    path('siblings/', siblings_list, name='siblings_list'),
    path('add_family/', add_family, name='add_family'),
    path('update-member/<int:member_id>/', update_member, name='update_member'),
    path('siblings/<int:sibling_id>/', sibling_detail, name='sibling_detail'),

    
    path('dashboard/', dashboard, name='dashboard'),


 # Tasks URL
    path('tasks/', tasks, name='tasks'),
    path('task_details/details/<int:pk>/', task_details, name='task_details'),
    path('add_task/', add_task, name='add_task'),
    path('task/update/<int:pk>/', update_task, name='update_task'),
    path('task/delete/<int:pk>/', delete_task, name='delete_task'),



    # Support URL
    path('support/', support, name='support'),

    # Analytics URL
    path('analytics/', analytics, name='analytics'),

    # Notifications URL
    path('notifications/', notifications, name='notifications'),
    path('add_notification/', add_notification, name='add_notification'),
    path('notifications/update/<int:pk>/', update_notification, name='update_notification'),
    path('notifications/delete/<int:pk>/', delete_notifications, name='delete_notifications'),



    # Activities URL

    path('user_details/<int:user_id>/', user_details, name='user_details'),
    path('education-journey/', education_journey, name='education_journey'),
    path('education_level/', education_level, name='education_level'),
    path('update_education/<int:education_id>/', update_education, name='update_education'),

    path('messaging',messaging,name='messaging' ),

    path('activities/', activity_list, name='activity_list'),
    path('activities/add/', add_activity, name='add_activity'),
    path('delete_activity/<int:pk>/', delete_activity, name='delete_activity'),  # Actual deletion URL
    path('update_activity/<int:pk>/', update_activity, name='update_activity'),
    path('activity/<int:activity_id>/', activity_detail, name='activity_detail'),


    path('skills/', skills_view, name='skills'),
    path('certification_list', certification_list, name='certification_list'),
    path('certification_detail/<int:pk>/', certification_detail, name='certification_detail'),
    path('certification_add/', certification_add, name='certification_add'),
    path('<int:pk>/edit/', certification_update, name='certification_update'),
    path('certification_delete/<int:pk>/', certification_delete, name='certification_delete'),


    path('projects/', projects_list, name='projects_list'),
    path('projects/<int:project_id>/', project_detail, name='project_detail'),
    path('projects/add/', add_project, name='add_project'),
    path('projects/<int:project_id>/edit/', edit_project, name='edit_project'),
    path('projects/<int:project_id>/delete/', delete_project, name='delete_project'),

    path('subscribe/', subscribe_newsletter, name='subscribe_newsletter'),

    path('download_report/', download_report, name='download_report'),

    path('fellomarley_pdf/', generate_full_pdf, name='fellomarley_pdf'),

    path('support/<int:pk>/', support_detail, name='support_detail'),
    path('support/new/', support_create, name='support_create'),
    path('support/<int:pk>/edit/', support_update, name='support_update'),
    path('support/<int:pk>/delete/', support_delete, name='support_delete'),

    path('skills/', skill_list, name='skill_list'),
    path('skills/<int:pk>/', skill_detail, name='skill_detail'),
    path('skills/new/', skill_form, name='skill_create'),
    path('skills/edit/<int:pk>/', skill_form, name='skill_edit'),
    path('skills/delete/<int:pk>/', skill_delete, name='skill_delete'),



    path("send-response/<int:contact_id>/", send_response, name="send_response"),
    path("admin/event/response/<int:event_id>/", send_event_response, name="send_event_response"),

     path('testimonials/', testimonials_list, name='testimonials_list'),
    path('testimonials/add/', add_testimonial, name='add_testimonial'),


    path('volunteers/', volunteer_list, name='volunteer_list'),
    path('volunteers/signup/', volunteer_signup, name='volunteer_signup'),

    path('jobs/', job_list, name='job_list'),
    path('jobs/post/', post_job, name='post_job'),

    path('donate/', donate, name='donate'),
    
    path('faq/', faq_list, name='faq_list'),
    path('add_faq/', add_faq, name='add_faq'),


]






if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)







   
