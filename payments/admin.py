from japos.payments.models import SubPayment, Commission, Payment
from django.contrib import admin

class SubPaymentAdmin(admin.ModelAdmin):
    pass

class CommissionAdmin(admin.ModelAdmin):
    pass

class PaymentAdmin(admin.ModelAdmin):
    pass

admin.site.register(SubPayment, SubPaymentAdmin)
admin.site.register(Commission, CommissionAdmin)
admin.site.register(Payment, PaymentAdmin)