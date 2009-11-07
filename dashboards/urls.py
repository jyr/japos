from django.conf.urls.defaults import *

urlpatterns = patterns('japos.dashboards.views',
    (r'^$', 'index')
)