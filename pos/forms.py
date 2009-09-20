from django import forms

from japos.pos.models import Pos

class PosForm(forms.ModelForm):
    sku = forms.CharField(widget = forms.TextInput(attrs={'class': 'text-input small-input'}), required=False)
    name = forms.CharField(widget = forms.TextInput(attrs={'class': 'text-input small-input'}))
        
    class Meta:
        model = Pos