from django.shortcuts import render_to_response
from django.core.paginator import Paginator
from django.db.models import Q

from japos.pos.models import Pos
from japos.base import Headers, JsonResponse

templates = 'backend/pos/'

def index(request):
    data = "Pos";
    return Headers(render_to_response(templates+'index.html', {'data': data}))

def list(request):
    search = request.POST.get('search')
    if(search):
        data = Pos.objects.filter(
            Q(sku__contains = search) |
            Q(name__contains = search)
        )
    else:
        data = Pos.objects.all()
        
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

def delete(request, pos_id):
    data = Pos.objects.get(pk = pos_id)
    data.delete()

    values = {'title': 'Success: Delete', 'text': 'Pos '+ pos_id + ' deleted', 'image': '/media/img/backend/Symbol-delete.png'}
    return JsonResponse(values)