from japos.pos.models import Pos
from django.contrib import admin

class PosAdmin(admin.ModelAdmin):
    pass

admin.site.register(Pos, PosAdmin)