from django.contrib import admin
from django.urls import path
from . import views

from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('signup', views.signaction, name='signup'),
    path('signupb', views.signactionbusiness, name='signup'),
    path('book', views.booking, name="book"),
]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
