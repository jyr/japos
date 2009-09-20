from japos.crews.models import Root, Admin, Auditor, Cashier, Salesman
from django.contrib import admin

class EmployeeAdmin(admin.ModelAdmin):
    pass

class RootAdmin(EmployeeAdmin):
    pass

class AdminAdmin(EmployeeAdmin):
    pass

class AuditorAdmin(EmployeeAdmin):
    pass

class CashierAdmin(EmployeeAdmin):
    pass

class SalesmanAdmin(EmployeeAdmin):
    pass

admin.site.register(Root, RootAdmin)
admin.site.register(Admin, AdminAdmin)
admin.site.register(Auditor, AuditorAdmin)
admin.site.register(Cashier, CashierAdmin)
admin.site.register(Salesman, SalesmanAdmin)