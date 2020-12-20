from django.shortcuts import render
from django.http import HttpResponse
import MySQLdb

# Create your views here.
def index(request):
    return HttpResponse('OK')


def SinhVien(request):
    db = MySQLdb.connect(user='root', db='courses_enrollment', passwd='', host='localhost')
    cursor = db.cursor()
    cursor.execute('SELECT * FROM sinh_vien')
    # ccursor.execute("insert into courses_enrollment.mon_hoc value('003','He co so du lieu',3,'2');")
    names = cursor.fetchall()
    db.close()
    return render(request, 'sinhvien/index.html', {'student': names})
