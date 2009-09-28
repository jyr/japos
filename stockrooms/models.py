from django.db import models
from django.utils.translation import gettext_lazy as _

from japos.pos.models import Pos
from japos.goods.models import Product
from japos.discounts.models import Discount
from japos.taxes.models import Tax

class StockRoom(models.Model):
    #sku = models.CharField(max_length = 10, unique = True, blank = False, null = True, verbose_name = _("SKU"))
    pos = models.ForeignKey(Pos, blank = False, null = True, verbose_name = _('Point of Sale'))
    barcode = models.CharField(max_length = 45, unique = True, verbose_name = _('Barcode'))
    product = models.ForeignKey(Product, blank = False, null = True, verbose_name = _('Product'))
    stock = models.PositiveIntegerField(blank = False, null = True, verbose_name = _('Stock'))
    price = models.FloatField(blank = False, null = True, verbose_name = _('Price'))
    discount = models.ForeignKey(Discount, blank = True, null = True, verbose_name = _('Discount'))
    tax = models.ForeignKey(Tax, blank = True, null = True, verbose_name = _('Tax'))
    date_created = models.DateTimeField(auto_now_add = True)
    date_modified = models.DateTimeField(auto_now = True)
    
    def __unicode__(self):
        return "%s - %s" % (self.pos, unicode(self.product))