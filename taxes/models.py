from django.db import models
from django.utils.translation import gettext_lazy as _

class Tax(models.Model):
    initials = models.CharField(max_length = 45, unique = True)
    percentage = models.DecimalField(max_digits = 9, decimal_places = 3, blank = True, null = True, verbose_name = _("Percentage"))
    is_enabled = models.BooleanField(default = False)
    is_default = models.BooleanField(default = False)
    date_created = models.DateTimeField(auto_now_add = True)
    date_modified = models.DateTimeField(auto_now = True)
    
    def __unicode__(self):
        return '%s - %d' %(self.initials, self.percentage)
