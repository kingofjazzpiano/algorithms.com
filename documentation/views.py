from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse

import requests


def architecture_view(request):
    return render(request, 'documentation/architecture.html')


@csrf_exempt
def struct_proxy(request):

    # URL of the Structurizr instance
    struct_url = "http://localhost:8080"

    # Forward the request to Structurizr
    response = requests.get(struct_url, headers=request.headers,
                            cookies=request.COOKIES)

    return HttpResponse(response.content, status=response.status_code,
                        content_type=response.headers["Content-Type"])
