from django.db import models
from django.utils.translation import gettext_lazy as _

from japos.sales.models import Sale

class Reason(models.Model):
    sku = models.CharField(max_length = 10, unique = True, blank = False, null = True, verbose_name = _("SKU"))
    motive = models.CharField(max_length = 45, verbose_name = _('Motive'))
    date_created = models.DateTimeField(auto_now_add = True, verbose_name = _("Date Created"))
    date_modified = models.DateTimeField(auto_now = True, verbose_name = _("Date Modified"))
    
    def __unicode__(self):
        return self.sku

class Cancellation(models.Model):
    sku = models.CharField(max_length = 10, unique = True, blank = False, null = True, verbose_name = _("SKU"))
    sale = models.OneToOneField(Sale, verbose_name = _('Sale'))
    reason = models.ForeignKey(Reason, verbose_name = _('Reason'))
    date_created = models.DateTimeField(auto_now_add = True, verbose_name = _("Date Created"))
    date_modified = models.DateTimeField(auto_now = True, verbose_name = _("Date Modified"))
    
    def __unicode__(self):
        return self.sku