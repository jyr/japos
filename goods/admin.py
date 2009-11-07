from japos.goods.models import Group, Product
from django.contrib import admin

class GroupAdmin(admin.ModelAdmin):
    pass

class ProductAdmin(admin.ModelAdmin):
    pass

admin.site.register(Group, GroupAdmin)
admin.site.register(Product, ProductAdmin)