from django.conf.urls.defaults import *

urlpatterns = patterns('japos.coins.views',
    (r'^$', 'index'),
    (r'^list/$', 'list'),
    (r'^edit/(?P<money_id>\d+)$', 'get'),
    (r'^delete/(?P<money_id>\d+)$', 'delete'),
    (r'^add/$', 'get')
)