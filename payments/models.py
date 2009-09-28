from django.db import models
from django.utils.translation import gettext_lazy as _

from japos.paymentforms.models import PaymentForm
from japos.coins.models import Money
from japos.sales.models import Sale
from japos.crews.models import Employee

class SubPayment(models.Model):
    sku = models.CharField(max_length = 10, unique = True, blank = False, null = True, verbose_name = _("SKU"))
    payment_form = models.ForeignKey(PaymentForm, verbose_name = _('Payment Form'))
    received = models.DecimalField(max_digits = 9, decimal_places = 3, null =True, verbose_name = _('Received'))
    money = models.ForeignKey(Money, verbose_name = _('Money'))
    date_created = models.DateTimeField(auto_now_add = True, verbose_name = _("Date Created"))
    date_modified = models.DateTimeField(auto_now = True, verbose_name = _("Date Modified"))

    def __unicode__(self):
        return self.sku

class Commission(models.Model):
    percentage = models.DecimalField(max_digits = 9, decimal_places = 3, verbose_name = _("Percentage"))

class Payment(models.Model):
    sku = models.CharField(max_length = 10, unique = True, blank = False, null = True, verbose_name = _("SKU"))
    sale = models.ForeignKey(Sale, unique = True, verbose_name = _('Sale'))
    subpayment = models.ManyToManyField(SubPayment, verbose_name = _('Sub Payment'))
    change = models.FloatField(blank = True, null = True, verbose_name = _('Change'))
    subtotal = models.FloatField(default = False, editable = False, verbose_name = _('Sub Total'))
    total = models.FloatField(default = False, verbose_name = _('Total'))
    salesman = models.ForeignKey(Employee, blank = True, null = True, verbose_name = _('Salesman'))
    commission = models.ForeignKey(Commission, blank = True, null = True, verbose_name = _('Commission'))
    date_printing = models.DateTimeField(auto_now = True, verbose_name = _("Date Printing"))
    date_created = models.DateTimeField(auto_now_add = True, verbose_name = _("Date Created"))
    date_modified = models.DateTimeField(auto_now = True, verbose_name = _("Date Modified"))
    
    def __unicode__(self):
        return self.sku