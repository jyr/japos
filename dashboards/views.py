from django.shortcuts import render_to_response
from django.contrib.auth.decorators import login_required

from japos.base import Headers

templates = "backend/dashboards/"

@login_required
def index(request):
    data = "Dashboard"
    return Headers(render_to_response(templates+'index.html', {'data': data}))