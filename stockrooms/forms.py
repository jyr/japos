from django import forms

from japos.stockrooms.models import StockRoom

class StockRoomForm(forms.ModelForm):
    barcode = forms.CharField(widget=forms.TextInput(attrs={'class': 'text-input small-input'}))
    stock = forms.IntegerField(widget=forms.TextInput(attrs={'class': 'text-input small-input'}))
    price = forms.FloatField(widget=forms.TextInput(attrs={'class': 'text-input small-input'}))
    
    class Meta:
        model = StockRoom
    