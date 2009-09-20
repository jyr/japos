from django.db import models
from django.utils.translation import gettext_lazy as _

from japos.discounts.models import Discount

class Group(models.Model):
    sku = models.CharField(max_length = 10, unique = True, blank = False, null = True, verbose_name = _("SKU"))
    name = models.CharField(max_length = 45, blank = False, null = True, unique = True, verbose_name = _("Group Name"))
    date_created = models.DateTimeField(auto_now_add = True)
    date_modified = models.DateTimeField(auto_now = True)
    
    def __unicode__(self):
        return self.name

class Product(models.Model):
    sku = models.CharField(max_length = 10, unique = True, blank = False, null = True, verbose_name = _("SKU"))
    barcode = models.CharField(max_length = 45, unique = True, verbose_name = _("Barcode"))
    name = models.CharField(max_length = 45, unique = True, verbose_name = _("Name"))
    description = models.TextField(blank = False, null = True, verbose_name = _("Description"))
    stock = models.IntegerField(blank = False, null = True, verbose_name = _('Stock'))
    group = models.ForeignKey(Group, verbose_name = _("Group"))
    purchase_price = models.DecimalField(max_digits = 9, decimal_places = 3, verbose_name = _("Purchase price"))
    discount = models.ForeignKey(Discount, verbose_name = _("Discount"))
    date_created = models.DateTimeField(auto_now_add = True)
    date_modified = models.DateTimeField(auto_now = True)
    
    def __unicode__(self):
        return '(%s) %s - %i' %(self.sku, self.name, self.stock)