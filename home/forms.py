from django import forms

class loginForm(forms.Form):
    username = forms.CharField(max_length=16)
    password = forms.CharField(max_length=16, widget=forms.PasswordInput)

