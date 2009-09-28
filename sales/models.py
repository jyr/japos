from django.db import models
from django.utils.translation import gettext_lazy as _

from japos.stockrooms.models import StockRoom
from japos.openings.models import Opening
from japos.discounts.models import Discount

class ShoppingCart(models.Model):
    stock_room = models.ForeignKey(StockRoom, verbose_name = _('Stock Room'))
    amount = models.PositiveIntegerField(verbose_name = _('Amount'))
    date_created = models.DateTimeField(auto_now_add = True)
    date_modified = models.DateTimeField(auto_now = True)
    
    def __unicode__(self):
        return self.sku

class Sale(models.Model):
    sku = models.CharField(max_length = 10, unique = True, blank = False, null = True, verbose_name = _("SKU"))
    opening = models.ForeignKey(Opening, verbose_name = _('Opening'))
    shopping_cart = models.ManyToManyField(ShoppingCart, blank = True, null = True)
    discount = models.ForeignKey(Discount, blank = True, null = True)
    date_created = models.DateTimeField(auto_now_add = True)
    date_modified = models.DateTimeField(auto_now = True)
    