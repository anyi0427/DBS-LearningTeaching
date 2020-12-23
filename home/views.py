from django.shortcuts import redirect, render
from django.http import HttpResponse
import MySQLdb

from .forms import loginForm
from django.views import View
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required

# Create your views here.

def home(request):
    return render(request, 'home/index.html')

class loginUser(View):
    def get(self,request):
        lF =  loginForm
        return render(request, 'home/login.html',{'lF':lF})

    def post(self,request):
        username  = request.POST['username']
        pasword = request.POST['password']

        user = authenticate(request, username=username, password=pasword)
        if user is not None:
            login(request, user)
            return redirect('home:total')
        else:
            lF =  loginForm
            return render(request, 'home/login.html',{'lF':lF})

@login_required
def total(request):
    return render(request, 'home/totalPage.html')

@login_required
def logoutUser(request):
    logout(request)
    return render(request, 'home/index.html')