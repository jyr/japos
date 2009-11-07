from django.db import models
from django.utils.translation import gettext_lazy as _

AVAILABILITY_CHOICES = (('E',_('Employe Discounts')), ('C', _('Courtesies')), ('P', _('Promotion')), ('D', _('Discount')))

class Discount(models.Model):
    percentage = models.DecimalField(max_digits = 9, decimal_places = 3, null =True, verbose_name = _("Percentage"))
    type = models.CharField(max_length = 45, choices = AVAILABILITY_CHOICES, verbose_name = _('Type Discounts'))
    is_enabled = models.BooleanField(default = False)
    is_default = models.BooleanField(default = False)
    date_created = models.DateTimeField(auto_now_add = True)
    date_modified = models.DateTimeField(auto_now = True)
    
    def __unicode__(self):
        return "%.3f %%" % self.percentage