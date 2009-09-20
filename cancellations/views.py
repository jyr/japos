from django.shortcuts import render_to_response
from django.http import HttpResponse
from django.core.paginator import Paginator
from django.utils import simplejson
from django.db.models import Q
from japos.cancellations.models import Cancellation

templates = 'backend/cancellations/'

def index(request):
    data = "Cancellations"
    return render_to_response(templates+'index.html', {'data': data})

def list(request):
    data = Cancellation.objects.all()
    return render_to_response(templates+'list.html', {'data': data})