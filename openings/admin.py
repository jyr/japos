from japos.openings.models import Opening
from django.contrib import admin

class OpeningAdmin(admin.ModelAdmin):
    pass

admin.site.register(Opening, OpeningAdmin)