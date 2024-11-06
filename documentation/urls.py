from django.urls import path
from django.views.generic import RedirectView

from . import views


urlpatterns = [
    path('architecture/', views.architecture_view, name='architecture'),
]

