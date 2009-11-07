from django.conf.urls.defaults import *
from django.views.generic.create_update import create_object as create
from django.views.generic.create_update import update_object as update

from japos.stockrooms.forms import StockRoomForm

edit = {
    "form_class": StockRoomForm,
    "template_name": "backend/stockrooms/edit.html",
}

add = {
    "form_class": StockRoomForm,
    "template_name": "backend/stockrooms/add.html"
}

urlpatterns = patterns('japos.stockrooms.views',
    (r'^$', 'index'),
    (r'list/', 'list'),
    (r'^edit/(?P<object_id>\d+)$', update, edit),
    (r'^add/$', create, add),
    (r'^delete/(?P<stockroom_id>\d+)$', 'delete')
)