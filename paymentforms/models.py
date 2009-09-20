from django.db import models
from django.utils.translation import gettext_lazy as _

class PaymentForm(models.Model):
    name = models.CharField(max_length = 45, unique = True, verbose_name = _('Name'))
    percentage = models.FloatField(blank = True, null = True, default = 0, verbose_name = _('Percentage'))
    is_enabled = models.BooleanField(default = False, blank = False, verbose_name = _('Enabled'))
    is_default = models.BooleanField(default = False, verbose_name = _('Default'))
    is_change = models.BooleanField(default = False, verbose_name = _('Change'))
    date_created = models.DateTimeField(auto_now_add = True, verbose_name = _("Date Created"))
    date_modified = models.DateTimeField(auto_now = True, verbose_name = _("Date Modified"))
    
    def __unicode__(self):
        return self.name