from django.db import models
from django.utils.translation import gettext_lazy as _

from japos.pos.models import Pos
from japos.goods.models import Product

class Transfer(models.Model):
    sku = models.CharField(max_length = 10, unique = True, blank = False, null = True, verbose_name = _("SKU"))
    pos_origin = models.ForeignKey(Pos, related_name = "pos_prev", verbose_name = _("Point of Sale Origin"))
    pos_destiny = models.ForeignKey(Pos, related_name = "pos_current", verbose_name = _("Point of Sale Destiny"))
    product = models.ForeignKey(Product)
    units = models.PositiveIntegerField()
    date_created = models.DateTimeField(auto_now_add = True, verbose_name = _("Date Created"))
    date_modified = models.DateTimeField(auto_now = True, verbose_name = _("Date Modified"))
    
    def __unicode__(self):
        return self.sku

class TransferStockRoom(models.Model):
    sku = models.CharField(max_length = 10, unique = True, blank = False, null = True, verbose_name = _("SKU"))
    pos = models.ForeignKey(Pos, blank = True, null = True, verbose_name = _('Point of Sale'))
    product = models.ForeignKey(Product, blank = True, null = True, verbose_name = _('Product'))
    units = models.PositiveIntegerField(blank = True, null = True, verbose_name = _('Units'))
    refunds = models.BooleanField(default = False, verbose_name = _('Refunds'))
    date_created = models.DateTimeField(auto_now_add = True, verbose_name = _("Date Created"))
    date_modified = models.DateTimeField(auto_now = True, verbose_name = _("Date Modified"))
    
    def __unicode__(self):
        return self.sku