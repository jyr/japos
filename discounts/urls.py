from django.conf.urls.defaults import *
from django.views.generic.create_update import update_object as update
from django.views.generic.create_update import create_object as create

from japos.discounts.forms import DiscountForm

edit = {
    'form_class': DiscountForm,
    'template_name': 'backend/discounts/edit.html',
    'post_save_redirect': '/backend/discounts/'
}

add = {
    'form_class': DiscountForm,
    'template_name': 'backend/discounts/add.html',
    'post_save_redirect': '/backend/discounts/'
}

urlpatterns = patterns('japos.discounts.views',
    (r'^$', 'index'),
    (r'^list/$', 'list'),
    (r'^delete/(?P<discount_id>\d+)$', 'delete'),
    (r'^edit/(?P<object_id>\d+)$', update, edit),
    (r'^add/$', create, add)
)