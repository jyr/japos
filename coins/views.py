#from django.views.decorators.cache import cache_control, never_cache
from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response, get_object_or_404
from django.core.paginator import Paginator
from django.db.models import Q
from django.http import HttpResponseRedirect

from japos.base import JsonResponse, Headers
from japos.coins.models import Money
from forms import MoneyForm

templates = 'backend/coins/'

@login_required
def index(request):
    data = "Coins"
    return Headers(render_to_response(templates+'index.html',{'data': data}))

@login_required
def list(request):
    search = request.POST.get('search')
    if(search):
        data = Money.objects.filter(
            Q(initials__contains = search) |
            Q(value__contains = search) |
            Q(currency__contains = search) 
        )
    else:
        data = Money.objects.all()
        
    paginator = Paginator(data, 10)
    
    try:
        page = int(request.GET.get('page','1'))
    except ValueError:
        page = 1
    
    try:
        pagination = paginator.page(page)
    except (EmptyPage, InvalidPage):
        pagination = paginator.page(paginator.num_pages)
    #assert False,data

    return Headers(render_to_response(templates+'list.html', {'data': pagination, 'range': paginator}))

@login_required
def get(request, money_id = None):
    if money_id:
        money = get_object_or_404(Money, id=money_id)
        html = 'edit.html'
    else:
        money = None
        html = 'add.html'
        
    if request.POST:
        form = MoneyForm(request.POST, instance=money)
        if form.is_valid():
            form.save()
            if money_id:
                values = {'title': 'Success: Delete', 'text': 'Opening number '+ money_id + ' deleted', 'image': '/media/img/backend/Symbol-delete.png'}
                return JsonResponse(values)
            else:
                return HttpResponseRedirect('/backend/coins/')
    else:
        form = MoneyForm(instance=money)
        if money_id:
            return Headers(render_to_response(templates+html, {'form': form, 'id': money_id}))
        else:
            return Headers(render_to_response(templates+html, {'form': form}))

@login_required
def delete(request, money_id):
    data = Money.objects.get(pk = money_id)
    data.delete()
    
    values = {'title': 'Success: Delete', 'text': 'Currency '+ money_id + ' deleted', 'image': '/media/img/backend/Symbol-delete.png'}
    return JsonResponse(values)