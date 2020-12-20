from django import forms


class evaluate_Form(forms.Form):
    codeSubject = forms.CharField(max_length=6, widget=forms.TextInput(attrs={'type':'text', 'name':'name', 'placeholder':'Mã môn', 'required':''}))
    groupClass = forms.CharField(max_length=7, widget=forms.TextInput(attrs={'type':'text', 'name':'name', 'placeholder':'Nhóm lớp', 'required':''}))
    evaluate = forms.CharField(widget = forms.Textarea(attrs={'name':'messager', 'placeholder':'Nội dung', 'required':''}))
    