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
   path('qllophoc/<str:khoa>/', views.qllophoc, name = "qllophoc"),
   path('updatelophoc/<str:khoa>/<str:lop>/', views.updateLophoc, name = "updateLophoc"),
   path('deletelophoc/<str:khoa>/<str:lop>/', views.deleteLophoc, name = "deleteLophoc"),
   path('newlophoc/<str:khoa>/', views.newLophoc, name = "newLophoc"),
   path('qlgiaotrinh/<str:gv>/', views.qlgiaotrinh, name = "qlgiaotrinh"),
   path('updategiaotrinh/<str:gv>/<str:monhoc>/', views.updategiaotrinh, name = "updategiaotrinh"),
   path('tracuupdt/', views.tracuupdt, name = "tracuupdt"),
   path('tracuu_monhoc_khoa/', views.tracuu_monhoc_khoa, name = "tracuu_monhoc_khoa"),
   path('tracuu_lophoc_khoa/', views.tracuu_lophoc_khoa, name = "tracuu_lophoc_khoa"),
   path('tracuu_lophoc_sinhvien/', views.tracuu_lophoc_sinhvien, name = "tracuu_lophoc_sinhvien"),
   path('tracuu_lophoc_giangvien/', views.tracuu_lophoc_giangvien, name = "tracuu_lophoc_giangvien"),
   path('tracuukhoa/<str:khoa>/', views.tracuukhoa, name = "tracuukhoa"),
   path('tracuu_giangvien_khoa/', views.tracuu_giangvien_khoa, name = "tracuu_giangvien_khoa"),
   path('tracuu_sinhvien_lop/', views.tracuu_sinhvien_lop, name = "tracuu_sinhvien_lop"),
   path('tracuu_sinhvien_khoa/', views.tracuu_sinhvien_khoa, name = "tracuu_sinhvien_khoa"),
   path('tracuugiangvien/<str:gv>/', views.tracuugiangvien, name = "tracuugiangvien"),
   path('tracuu_monhoc_giangvien/', views.tracuu_monhoc_giangvien, name = "tracuu_monhoc_giangvien"),
]
