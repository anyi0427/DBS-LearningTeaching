from django.db import models

# Create your models here.
class evaluateForm(models.Model):
    codeSubject = models.CharField(max_length=6)
    groupClass = models.CharField(max_length=7)
    evaluate = models.TextField()
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.evaluate