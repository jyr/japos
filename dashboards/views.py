from django.shortcuts import render_to_response

from japos.base import Headers

templates = "backend/dashboards/"

def index(request):
    data = "Dashboard"
    return Headers(render_to_response(templates+'index.html', {'data': data}))