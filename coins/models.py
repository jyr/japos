from django.db import models
from django.utils.translation import gettext_lazy as _

class Money(models.Model):
    initials = models.CharField(max_length = 10, unique = True, verbose_name = _('Initials'))
    value = models.DecimalField(max_digits = 9, decimal_places = 3, null =True, verbose_name = _('Value'))
    currency = models.CharField(max_length = 45, unique = True, verbose_name = _('Currency'))
    is_enabled = models.BooleanField(default = False, blank = False, verbose_name = _('Enabled'))
    is_default = models.BooleanField(default = False, verbose_name = _('Default'))
    date_created = models.DateTimeField(auto_now_add = True, verbose_name = _("Date Created"))
    date_modified = models.DateTimeField(auto_now = True, verbose_name = _("Date Modified"))
    
    def __unicode__(self):
        return self.currency