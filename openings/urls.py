from django.conf.urls.defaults import *

urlpatterns = patterns('japos.openings.views',
    (r'^$', 'index'),
    (r'^list/$', 'list'),
    (r'^detail/(?P<opening_id>\d+)$', 'detail'),
    (r'^delete/(?P<opening_id>\d+)$', 'delete'),
    (r'^autocomplete/$', 'autocomplete')
)