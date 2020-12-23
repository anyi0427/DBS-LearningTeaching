from django.shortcuts import render
from django.http import HttpResponse

from .forms import loginForm
from django.views import View
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.contrib.auth import logout

# Create your views here.
class loginUser(View):
    def get(self,request):
        lF =  loginForm
        return render(request, 'login/login.html',{'lF':lF})

    def post(self,request):
        username  = request.POST['username']
        pasword = request.POST['password']

        user = authenticate(request, username=username, password=pasword)
        if user is not None:
            login(request, user)
            return render(request, 'login/user.html')
        else:
            lF =  loginForm
            return render(request, 'login/login.html',{'lF':lF})

def logoutUser(request):
    logout(request)
    return render(request, 'home/index.html')