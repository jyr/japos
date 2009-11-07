from japos.modules.models import ModuleType, Module
from django.contrib import admin

class ModuleAdmin(admin.ModelAdmin):
    pass

class ModuleTypeAdmin(admin.ModelAdmin):
    pass

admin.site.register(ModuleType, ModuleTypeAdmin)
admin.site.register(Module, ModuleAdmin)