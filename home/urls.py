from django.urls import path
from . import views

app_name = 'home'

urlpatterns = [
   path('', views.home),
   path('login/', views.loginUser.as_view(), name = "loginUser"),
   path('total/', views.total, name = "total"),
   path('', views.logoutUser, name = "logout"),
]