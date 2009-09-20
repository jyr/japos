from django import forms

from japos.paymentforms.models import PaymentForm

class PaymentFormForm(forms.ModelForm):
    percentage = forms.CharField(widget = forms.TextInput(attrs= {'class': 'text-input small-input'}))
    name = forms.CharField(widget = forms.TextInput(attrs= {'class': 'text-input small-input'}))
    class Meta:
        model = PaymentForm