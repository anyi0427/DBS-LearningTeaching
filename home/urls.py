from django.urls import path
from . import views
app_name = 'home'
urlpatterns = [
   path('', views.Form, name = "home"),
   path('saveEvaluateForm/', views.saveEvaluateForm, name = "saveEvaluateForm"),
]