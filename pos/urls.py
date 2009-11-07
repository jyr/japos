from django.conf.urls.defaults import *
from django.views.generic.create_update import update_object as update
from django.views.generic.create_update import create_object as create

from japos.pos.models import Pos
from japos.pos.forms import PosForm

edit = {
    "form_class": PosForm,
    "template_name": "backend/pos/edit.html",
    "post_save_redirect" : "/backend/pos/"
}

add = {
    "form_class":PosForm,
    "template_name":"backend/pos/add.html",
    "post_save_redirect" : "/backend/pos/"
}

urlpatterns = patterns('japos.pos.views',
    (r'^$', 'index'),
    (r'^list/$', 'list'),
    (r'^edit/(?P<object_id>\d+)$', update, edit),
    (r'^add/$', create, add),
    (r'^delete/(?P<pos_id>\d+)$', 'delete')
)