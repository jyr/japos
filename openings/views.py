from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response
from django.core.paginator import Paginator
from django.db.models import Q

from japos.openings.models import Opening
from japos.base import JsonResponse

data = {}

@login_required
def index(request):
    data = "Openings"
    return render_to_response('backend/openings/index.html',{'data': data})

@login_required
def list(request):
    """
        Busca y lista las aperturas
    """
    search = request.POST.get('search')
    if(search):
        data = Opening.objects.filter(
            Q(initial_fund__contains = search) |
            Q(pos__sku__contains = search) | Q(pos__name__contains = search) | 
            Q(auditor__user__first_name__contains = search) | Q(auditor__user__last_name__contains = search) |
            Q(cashier__user__first_name__contains = search) | Q(cashier__user__last_name__contains = search) |
            Q(cashier__user__first_name__contains = search) | Q(cashier__user__last_name__contains = search)
        )
    else:
        data = Opening.objects.all()
    paginator = Paginator(data, 2)
    
    try:
        page = int(request.GET.get('page','1'))
    except ValueError:
        page = 1
    
    try:
        pagination = paginator.page(page)
    except (EmptyPage, InvalidPage):
        pagination = paginator.page(paginator.num_pages)
            
    return render_to_response('backend/openings/list.html', {'data': pagination, 'range': paginator})

@login_required    
def detail(request, opening_id):
    data = Opening.objects.get(pk = opening_id)
    return render_to_response('backend/openings/detail.html', {'data': data})

@login_required
def delete(request, opening_id):
    data = Opening.objects.get(pk = opening_id)
    data.delete()
    
    values = {'title': 'Success: Delete', 'text': 'Opening number '+ opening_id + ' deleted', 'image': '/media/img/backend/Symbol-delete.png'}
    return JsonResponse(values)

def autocomplete(request):
    search = request.GET.get('q', False)
    #assert False,search
    dic = {}
    if search:
        data = Opening.objects.filter(
            Q(initial_fund__contains = search) |
            Q(pos__sku__contains = search) | Q(pos__name__contains = search) | 
            Q(auditor__user__first_name__contains = search) | Q(auditor__user__last_name__contains = search) |
            Q(cashier__user__first_name__contains = search) | Q(cashier__user__last_name__contains = search) |
            Q(cashier__user__first_name__contains = search) | Q(cashier__user__last_name__contains = search)
        )
    #assert False,dir(data)
    #def results(results):
    di = []
    for i in data:
        di.append(i.pos.name+'\n')
        di.append(''+str(i.initial_fund)+' \n')
    
    #assert False,di
    return HttpResponse(di, mimetype="text/plain")