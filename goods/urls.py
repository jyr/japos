from django.conf.urls.defaults import *
from django.views.generic.create_update import create_object as create
from django.views.generic.create_update import update_object as update

from japos.goods.forms import ProductForm, GroupForm
add = {
    'form_class': ProductForm,
    'template_name': 'backend/goods/products/add.html',
    'post_save_redirect': '/backend/goods/'
}

edit = {
    'form_class': ProductForm,
    'template_name': 'backend/goods/products/edit.html',
    'post_save_redirect': '/backend/goods/list/'
}

add_g = {
    'form_class': GroupForm,
    'template_name': 'backend/goods/groups/add.html',
    'post_save_redirect': '/backend/goods/'
}

edit_g = {
    'form_class': GroupForm,
    'template_name': 'backend/goods/groups/edit.html',
    'post_save_redirect': '/backend/goods/'
}

urlpatterns = patterns('japos.goods.views',
    (r'^$', 'index'),
    (r'^list/$', 'list'),
    (r'^add/$', create, add),
    (r'^edit/(?P<object_id>\d+)$', update, edit),
    (r'^groups/add/$', create, add_g),
    (r'^groups/edit/(?P<object_id>\d+)$', update, edit_g)
)