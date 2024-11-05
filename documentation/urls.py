from django.urls import path
from django.views.generic import RedirectView

from . import views


urlpatterns = [
    path("", RedirectView.as_view(
            url="../documentation/sphinx/build/html/index.html",
            permanent=False)),
    path('architecture/', views.architecture_view, name='architecture'),
]
