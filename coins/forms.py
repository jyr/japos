from django import forms

from japos.coins.models import Money

"""
    Formulario desde Modelos

class MoneyForm(forms.ModelForm):
    class Meta:
        model = Money
        fields = ('initials','value', 'currency', 'is_enabled', 'is_default')
"""

class MoneyForm(forms.ModelForm):
    initials = forms.CharField(widget = forms.TextInput(attrs={'class': 'text-input small-input'}), required=False)
    value = forms.CharField(widget = forms.TextInput(attrs={'class': 'text-input small-input'}))
    currency = forms.CharField(widget = forms.TextInput(attrs={'class': 'text-input small-input'}))
    enabled = forms.CharField(widget = forms.CheckboxInput)
    default = forms.CharField(widget = forms.CheckboxInput)
    
    class Meta:
        model = Money