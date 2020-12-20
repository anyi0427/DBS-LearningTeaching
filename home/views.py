from django.shortcuts import render
from django.http import HttpResponse
from .forms import evaluate_Form
from .models import evaluateForm

# Create your views here.
def Form(request):
    ef = evaluate_Form
    return render(request, 'home/index.html', {'ef' : ef})

def saveEvaluateForm(request):
    if request.method == "POST":
        ef = evaluate_Form(request.POST)
        if ef.is_valid():
            saveEF = evaluateForm(codeSubject = ef.cleaned_data['codeSubject'],
                groupClass = ef.cleaned_data['groupClass'],
                evaluate = ef.cleaned_data['evaluate'])
            saveEF.save()
            return HttpResponse('Thành Công')
    else:
        return HttpResponse('Không thành công')
