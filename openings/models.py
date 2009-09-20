from django.db import models
from django.utils.translation import gettext_lazy as _

from japos.pos.models import Pos
from japos.crews.models import Auditor, Cashier

class Opening(models.Model):
    pos = models.ForeignKey(Pos, verbose_name = _("Name of Point of Sale"))
    auditor = models.ForeignKey(Auditor, verbose_name = _("Auditor"))
    cashier = models.ForeignKey(Cashier, verbose_name = _("Cashier"))
    initial_fund = models.DecimalField(max_digits = 9, decimal_places = 3, verbose_name = _("Initial Fund"))
    exchange_rate = models.DecimalField(max_digits = 9, decimal_places = 3, blank = True, null = True, verbose_name = _("Exchange Rate"))
    date_created = models.DateTimeField(auto_now_add = True)
    date_modified = models.DateTimeField(auto_now = True)
    
    def __unicode__(self):
        return "%s - %s" %(self.pos.sku, self.pos.name)