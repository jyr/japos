from django import forms

from japos.discounts.models import Discount

class DiscountForm(forms.ModelForm):
    percentage = forms.CharField(widget = forms.TextInput(attrs= {'class': 'text-input small-input'}))
    enabled = forms.CharField(widget = forms.CheckboxInput)
    default = forms.CharField(widget = forms.CheckboxInput)
    
    class Meta:
        model= Discount