from django.http import HttpResponse
from django.utils import simplejson

import datetime
    
def JsonResponse(dic):
    values = simplejson.dumps(dic)
    return HttpResponse(values, mimetype= "text/plain")

def Headers(response):
    #date = datetime.datetime.fromtimestamp(0)
    #day = date.strftime("%D, %d %M %Y %H:%i:%s")
    #response['Last-Modified'] =" "+day+" GMT"
    response['Expires'] = 'Fri, 14 Mar 1980 20:53:00 GMT'
    response['Cache-Control'] = 'no-cache, must-revalidate'
    response['Pragma'] = 'no-cache'
    return response