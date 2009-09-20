from django.db import models
from django.utils.translation import gettext_lazy as _

class Pos(models.Model):
    sku = models.CharField(max_length = 10, unique = True, blank = False, null = True, verbose_name = _("SKU"))
    name = models.CharField(max_length = 45, unique = True, blank = False, null = True, verbose_name = _("Name of Point of Sale"))
    date_created = models.DateTimeField(auto_now_add = True, verbose_name = _("Date Created"))
    date_modified = models.DateTimeField(auto_now = True, verbose_name = _("Date Modified"))
    
    def __unicode__(self):
        return self.name
