from japos.cancellations.models import Reason, Cancellation
from django.contrib import admin

class ReasonAdmin(admin.ModelAdmin):
    pass

class CancellationAdmin(admin.ModelAdmin):
    pass

admin.site.register(Reason, ReasonAdmin)
admin.site.register(Cancellation, CancellationAdmin)