from django.conf.urls.defaults import *

# Uncomment the next two lines to enable the admin:
from django.conf import settings
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Example:
    # (r'^japos/', include('japos.foo.urls')),

    # Uncomment the admin/doc line below and add 'django.contrib.admindocs' 
    # to INSTALLED_APPS to enable admin documentation:
    # (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    (r'^admin/(.*)', admin.site.root),
)

urlpatterns +=  patterns('',
    (r'^backend/openings/', include('japos.openings.urls')),
    (r'^backend/cancellations/', include('japos.cancellations.urls')),
    (r'^backend/coins/', include('japos.coins.urls')),
    (r'^backend/pos/', include('japos.pos.urls')),
    (r'^backend/discounts/', include('japos.discounts.urls')),
    (r'^backend/paymentforms/', include('japos.paymentforms.urls')),
    (r'^backend/taxes/', include('japos.taxes.urls')),
    (r'^backend/goods/', include('japos.goods.urls')),
    (r'^backend/stockrooms/', include('japos.stockrooms.urls')),
    (r'^backend/dashboards/', include('japos.dashboards.urls')),
)

urlpatterns += patterns('django.views', (r'^media/(?P<path>.*)$', 'static.serve', {'document_root': settings.STATIC_DOC_ROOT}))