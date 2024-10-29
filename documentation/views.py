from django.shortcuts import render

def architecture_view(request):
    return render(request, 'documentation/architecture.html')
