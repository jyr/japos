from japos.sales.models import ShoppingCart, Sale
from django.contrib import admin

class ShoppingCartAdmin(admin.ModelAdmin):
    pass

class SaleAdmin(admin.ModelAdmin):
    pass

admin.site.register(ShoppingCart, ShoppingCartAdmin)
admin.site.register(Sale, SaleAdmin)