from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response
from django.db.models import Q
from django.core.paginator import Paginator

from japos.paymentforms.models import PaymentForm
from japos.base import Headers, JsonResponse

templates = 'backend/paymentforms/'

@login_required
def index(request):
    data = "Payment Forms"
    return Headers(render_to_response(templates+'index.html', {'data': data}))

@login_required
def list(request):
    search = request.POST.get('search')
    if(search):
        data = PaymentForm.objects.filter(
            Q(percentage__contains = search) |
            Q(name__contains = search)
        )
    else:
        data = PaymentForm.objects.all()
        
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
def delete(request, paymentform_id):
    data = PaymentForm.objects.get(pk = paymentform_id)
    data.delete()

    values = {'title': 'Success: Delete', 'text': 'PaymentForms '+ paymentform_id + ' deleted', 'image': '/media/img/backend/Symbol-delete.png'}
    return JsonResponse(values)