from japos.transfers.models import Transfer, TransferStockRoom
from django.contrib import admin

class TransferAdmin(admin.ModelAdmin):
    pass

class TransferStockRoomAdmin(admin.ModelAdmin):
    pass

admin.site.register(Transfer, TransferAdmin)
admin.site.register(TransferStockRoom, TransferStockRoomAdmin)