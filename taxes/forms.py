from django import forms

from japos.taxes.models import Tax

class TaxForm(forms.ModelForm):
    initials = forms.CharField(widget = forms.TextInput(attrs={'class': 'text-input small-input'}))
    percentage = forms.CharField(widget = forms.TextInput(attrs={'class': 'text-input small-input'}))
    
    class Meta:
        model = Tax