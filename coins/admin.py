from japos.coins.models import Money
from django.contrib import admin

class MoneyAdmin(admin.ModelAdmin):
    pass

admin.site.register(Money, MoneyAdmin)