"""bookable URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from bookable1.views import index,list,manager,listing,book,login,adbook,accept,adm,queries,qu
from signup.views import signaction,signactionbusiness
import signup.urls

from django.urls import re_path,include 

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',index),
    path('SignUp.html/',signaction),
    # path('list.html/',signactionbusiness),
    path('list.html?flexRadioDefault=on/',signactionbusiness),
    path('signup/',include('signup.urls')),
    path('SignUp.html/index.html',index),
    path('login',login),
    path('search',listing),
    path('search_req',manager),
    path('list.html',list),
    re_path(r'^',include('bookable1.urls')),
    path('list.html/index.html',index),
    path('book.html',book),
    path('admin-bookings.html',adbook),
    path('accept',accept),
    path('index.html',index),
    path('adm',adm),
    path('queries.html',queries),
    path('query',qu),

    
]
