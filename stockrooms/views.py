from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response
from django.core.paginator import Paginator
from django.db.models import Q

from japos.base import Headers, JsonResponse
from japos.stockrooms.models import StockRoom

templates = 'backend/stockrooms/'

@login_required
def index(request):
    data  = "StockRooms"
    return Headers(render_to_response(templates+'index.html', {'data': data}))

@login_required
def list(request):
    search = request.POST.get('search')
    if(search):
        data = StockRoom.objects.filter(
            Q(product__name__contains = search) |
            Q(product__barcode__contains = search)
        )
    else:
        data = StockRoom.objects.all()
        
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

@login_required
def delete(request, stockroom_id):
    data = StockRoom.objects.get(pk = stockroom_id)
    data.delete()

    values = {'title': 'Success: Delete', 'text': 'StockRoom '+ stockroom_id + ' deleted', 'image': '/media/img/backend/Symbol-delete.png'}
    return JsonResponse(values)