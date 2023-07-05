# from importlib.resources import path
from django.urls import re_path
# from django.urls import path
from bookable1 import views

from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    re_path(r'^customer$', views.customerApi),
    re_path(r'^customer/([0-9]+)$', views.customerApi),

    re_path(r'^manager$', views.managerApi),
    re_path(r'^manager/([0-9]+)$', views.managerApi),

    re_path(r'^hall$', views.hallApi),
    re_path(r'^hall/([0-9]+)$', views.hallApi),

    re_path(r'^garden$', views.gardenApi),
    re_path(r'^garden/([0-9]+)$', views.gardenApi),

    re_path(r'^community_hall$', views.community_hallApi),
    re_path(r'^community_hall/([0-9]+)$', views.community_hallApi),

    re_path(r'^pool$', views.poolApi),
    re_path(r'^pool/([0-9]+)$', views.poolApi),

    re_path(r'^customer/savefile', views.SaveFile),
]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
