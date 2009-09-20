from django.shortcuts import render_to_response
from django.core.paginator import Paginator
from django.db.models import Q

from japos.base import Headers, JsonResponse
from japos.discounts.models import Discount

templates = "backend/discounts/"

def index(request):
    data = "Discounts"
    return Headers(render_to_response(templates+'index.html', {'data': data}))

def list(request):
    search = request.POST.get('search')
    if(search):
        data = Discount.objects.filter(
            Q(percentage__contains = search) |
            Q(type__contains = search)
        )
    else:
        data = Discount.objects.all()
        
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

def delete(request, discount_id):
    data = Discount.objects.get(pk = discount_id)
    data.delete()

    values = {'title': 'Success: Delete', 'text': 'Discounts '+ discount_id + ' deleted', 'image': '/media/img/backend/Symbol-delete.png'}
    return JsonResponse(values)