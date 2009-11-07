from japos.paymentforms.models import PaymentForm
from django.contrib import admin

class PaymentFormAdmin(admin.ModelAdmin):
    pass

admin.site.register(PaymentForm, PaymentFormAdmin)