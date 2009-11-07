from japos.discounts.models import Discount
from django.contrib import admin

class DiscountAdmin(admin.ModelAdmin):
    pass

admin.site.register(Discount, DiscountAdmin)
