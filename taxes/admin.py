from japos.taxes.models import Tax
from django.contrib import admin

class TaxAdmin(admin.ModelAdmin):
    pass

admin.site.register(Tax, TaxAdmin)