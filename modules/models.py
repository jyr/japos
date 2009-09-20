from django.db import models
from django.contrib.auth.models import Group
from django.utils.translation import ugettext as _

AVAILABILITY_CHOICES = ((1, 'Root'),(2,'Admin'),(3,'Auditor'),(4,'Cashier'),(5,'Salesman'))

class Module(models.Model):
    name = models.CharField(max_length = 45, blank = False, null = True, verbose_name = _("Module"))
    is_enabled = models.BooleanField(default = False)
    is_default = models.BooleanField(default = False)
    
    def __unicode__(self):
        return self.name
    
class ModuleType(models.Model):
    module = models.ForeignKey(Module)
    availability = models.SmallIntegerField(choices = AVAILABILITY_CHOICES, default = 0)
    
    def __unicode__(self):
        return self.module.name

#class Detail(models.Model):
#    module = models.ForeignKey(Module)
#    name = models.CharField(max_length = 45)