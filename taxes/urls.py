from django.conf.urls.defaults import *
from django.views.generic.create_update import update_object as update
from django.views.generic.create_update import create_object as create

from japos.taxes.models import Tax
from japos.taxes.forms import TaxForm

edit = {
    "form_class": TaxForm,
    "template_name": "backend/taxes/edit.html",
    "post_save_redirect" : "/backend/taxes/"
}

add = {
    "form_class": TaxForm,
    "template_name":"backend/taxes/add.html",
    "post_save_redirect" : "/backend/taxes/"
}

urlpatterns = patterns('japos.taxes.views',
    (r'^$', 'index'),
    (r'^list/$', 'list'),
    (r'^add/$', create, add),
    (r'^edit/(?P<object_id>\d+)', update, edit),
    (r'^delete/(?P<tax_id>\d+)', 'delete')
)
