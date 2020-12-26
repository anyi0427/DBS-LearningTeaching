from django.http.response import HttpResponseNotAllowed
from django.urls import path, include
from . import views

app_name = 'home'

urlpatterns = [
   path('', views.home,name="homepage"),
   path('login/', views.loginUser.as_view(), name = "loginUser"),
   path('total/', views.total, name = "total"),
   path('', views.logoutUser, name = "logout"),
   path('dkmh/', views.dkmh, name = "dkmh"),
   path('dk/<str:mamh>/',views.dangky, name='dangky'),
   path('dkerror/', views.dkerror, name='dangkyloi'),
   path('qlgiangday/', views.qlgiangday, name = "qlgiangday"),
   path('qlmonhoc/<str:khoa>/', views.qlmonhoc, name = "qlmonhoc"),
   path('updatemonhoc/<str:khoa>/<str:monhoc>/', views.updateMonhoc, name = "updateMonhoc"),
]
