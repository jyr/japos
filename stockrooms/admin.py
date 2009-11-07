from japos.stockrooms.models import StockRoom
from django.contrib import admin

class StockRoomAdmin(admin.ModelAdmin):
    pass

admin.site.register(StockRoom, StockRoomAdmin)