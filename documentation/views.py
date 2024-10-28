from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse, JsonResponse

import requests
from requests.exceptions import RequestException

import logging


logger = logging.getLogger(__name__)

STRUCTURIZR_URL = "http://localhost:8080"


def check_structurizr_status():
    """Check if Structurizr service is running."""
    try:
        response = requests.get(STRUCTURIZR_URL, timeout=2)
        return response.status_code == 200
    except RequestException:
        return False


@csrf_exempt
def struct_proxy(request):
    """
    Proxy view for Structurizr requests with improved error handling.
    """
    if not check_structurizr_status():
        return JsonResponse({
            'error': 'Structurizr service is not available. Please ensure it is running on port 8080.'
        }, status=503)

    try:
        # Forward the request to Structurizr
        response = requests.get(
            STRUCTURIZR_URL,
            headers={key: value for key, value in request.headers.items()
                    if key.lower() not in ['host', 'cookie']},
            cookies=request.COOKIES,
            timeout=5
        )
        
        # Get content type, defaulting to text/html
        content_type = response.headers.get("Content-Type", "text/html")
        
        return HttpResponse(
            content=response.content,
            status=response.status_code,
            content_type=content_type
        )
        
    except RequestException as e:
        logger.error(f"Structurizr proxy error: {str(e)}")
        return JsonResponse({
            'error': 'Failed to connect to Structurizr service',
            'details': str(e)
        }, status=502)


def architecture_view(request):
    """
    View for the architecture page with service status check.
    """
    structurizr_available = check_structurizr_status()
    return render(request, 'documentation/architecture.html', {
        'structurizr_available': structurizr_available
    })
