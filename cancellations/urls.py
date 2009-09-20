from django.conf.urls.defaults import *

urlpatterns = patterns('japos.cancellations.views',
    (r'^$', 'index'),
    (r'^list/$', 'list')
)