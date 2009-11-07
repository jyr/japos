from django.conf.urls.defaults import *
from django.contrib.auth.views import login
from django.views.generic.simple import redirect_to

from japos.accounts.views import logout

from django.conf import settings
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    (r'^admin/(.*)', admin.site.root),
)

urlpatterns +=  patterns('',
    (r'^$', redirect_to, {'url':'/backend/dashboards/'}),
    (r'^accounts/$', redirect_to, {'url': '/accounts/login/'}),
    (r'^accounts/login/$', login, {'template_name': 'login.html'}),
    (r'^accounts/logout/$', logout),
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