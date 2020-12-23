from django.urls import path
from . import views
app_name = 'login'

urlpatterns = [
   path('in', views.loginUser.as_view(), name = "loginUser"),
   path('out/',views.logoutUser, name='logout'),
]