from django.conf.urls.defaults import *
from django.views.generic.create_update import update_object as update
from django.views.generic.create_update import create_object as create

from japos.paymentforms.models import PaymentForm
from japos.paymentforms.forms import PaymentFormForm

edit = {
    "form_class": PaymentFormForm,
    "template_name": "backend/paymentforms/edit.html",
    "post_save_redirect" : "/backend/paymentforms/"
}

add = {
    "form_class": PaymentFormForm,
    "template_name":"backend/paymentforms/add.html",
    "post_save_redirect" : "/backend/paymentforms/"
}

urlpatterns = patterns('japos.paymentforms.views',
    (r'^$', 'index'),
    (r'^list/$', 'list'),
    (r'^edit/(?P<object_id>\d+)$', update, edit),
    (r'^add/$', create, add),
    (r'^delete/(?P<paymentform_id>\d+)$', 'delete')
)