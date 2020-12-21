from django.shortcuts import render
from django.http import HttpResponse
import MySQLdb

# Create your views here.
def homepage(request):    
    return render(request, 'home/index.html')

