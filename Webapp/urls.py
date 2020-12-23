from django.urls import path
from . import views
app_name = 'home'
urlpatterns = [
   path('', views.Form),
   path('saveEvaluateForm/', views.saveEvaluateForm, name = "saveEvaluateForm"),
   path('list/', views.SinhVien),
]