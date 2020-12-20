from django.urls import path
from . import views
app_name = 'SinhVien'
urlpatterns = [
   path('', views.SinhVien, name = "SinhVien"),
]