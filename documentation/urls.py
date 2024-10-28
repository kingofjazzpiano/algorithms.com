from django.urls import path
from django.views.generic import RedirectView

from . import views


urlpatterns = [
    path("", RedirectView.as_view(
            url="../static/documentation/html/index.html",
            permanent=False)),
    path('architecture/', views.architecture_view, name='architecture'),
    path('architecture/structurizr/', views.struct_proxy,
         name="structurizr_proxy")
]
