from django import forms

class loginForm(forms.Form):
    username = forms.CharField(max_length=16, widget=forms.TextInput(attrs={
        'id': 'inputEmail', 'class': 'form-control', 'placeholder': 'Tên đăng nhập', 'required': 'autofocus'
    }))
    password = forms.CharField(max_length=16, widget=forms.PasswordInput(attrs={
        'id': 'inputEmail', 'class': 'form-control', 'placeholder': 'Mật khẩu', 'required': 'autofocus'
    }))

