from django import forms

from japos.goods.models import Product, Group

class ProductForm(forms.ModelForm):
    sku = forms.CharField(widget = forms.TextInput(attrs={'class': 'text-input small-input'}))
    barcode = forms.CharField(widget = forms.TextInput(attrs={'class': 'text-input small-input'}))
    name = forms.CharField(widget = forms.TextInput(attrs={'class': 'text-input small-input'}))
    description = forms.CharField(widget = forms.Textarea(attrs={'class': 'textarea', 'rows': '5', 'cols': '50'}))
    stock = forms.IntegerField(widget = forms.TextInput(attrs={'class': 'text-input small-input'}))
    purchase_price = forms.DecimalField(widget = forms.TextInput(attrs={'class': 'text-input small-input'}))

    class Meta:
        model = Product

class GroupForm(forms.ModelForm):
    sku = forms.CharField(widget = forms.TextInput(attrs={'class': 'text-input small-input'}))
    name = forms.CharField(widget = forms.TextInput(attrs={'class': 'text-input small-input'}))
    class Meta:
        model = Group