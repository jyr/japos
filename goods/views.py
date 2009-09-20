from django.shortcuts import render_to_response
from django.core.paginator import Paginator
from django.db.models import Q

from japos.goods.models import Group, Product
from japos.base import JsonResponse, Headers

templates = "backend/goods/"

def index(request):
    data = "Goods"
    return Headers(render_to_response(templates+'index.html', {'data': data}))

def list(request):
    search = request.POST.get('search')
    if(search):
        data = Product.objects.filter(
            Q(sku__contains = search) |
            Q(barcode__contains = search) |
            Q(name__contains = search)
        )
    else:
        data = Product.objects.all()
        
    paginator = Paginator(data, 2)
    
    try:
        page = int(request.GET.get('page','1'))
    except ValueError:
        page = 1
    
    try:
        pagination = paginator.page(page)
    except (EmptyPage, InvalidPage):
        pagination = paginator.page(paginator.num_pages)

    return Headers(render_to_response(templates+'list.html', {'data': pagination, 'range': paginator}))
