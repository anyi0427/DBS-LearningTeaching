from django import forms

class loginForm(forms.Form):
    username = forms.CharField(max_length=16)
    password = forms.CharField(max_length=16, widget=forms.PasswordInput)

class dangkyForm(forms.Form):
    idlop = forms.IntegerField(max_value=1000000)
    mssv = forms.IntegerField(max_value=999999999)