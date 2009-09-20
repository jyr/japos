from django.shortcuts import render_to_response
from django.core.paginator import Paginator

from japos.taxes.models import Tax
from japos.base import Headers, JsonResponse

templates = "backend/taxes/"

def index(request):
    data = "Taxes"
    return Headers(render_to_response(templates+"index.html", {'data': data}))

def list(request):
    search = request.POST.get('search')
    if(search):
        data = Tax.objects.filter(
            Q(percentage__contains = search) |
            Q(initials__contains = search)
        )
    else:
        data = Tax.objects.all()
        
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

def delete(request, tax_id):
    data = Tax.objects.get(pk = tax_id)
    data.delete()

    values = {'title': 'Success: Delete', 'text': 'Tax '+ tax_id + ' deleted', 'image': '/media/img/backend/Symbol-delete.png'}
    return JsonResponse(values)
