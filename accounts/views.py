from django.contrib import auth
from django.http import HttpResponseRedirect

def logout(request):
    auth.logout(request)
    return HttpResponseRedirect("/")