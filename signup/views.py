from django.shortcuts import redirect, render
from bookable1.views import customerApi
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse
from bookable1.serializers import customerSerializer
from bookable1.models import customer, manager, admin, hall, community_hall, garden, pool, requested_hall, requested_garden, requested_pool, requested_community_hall
from django.core.files.storage import default_storage
from django.core.files.storage import FileSystemStorage
from django.core.mail import send_mail
import random
from django.http import HttpResponseRedirect


# Create your views here.
def signaction(request):
    selected_lang = request.POST.get('check')
    print(selected_lang)
    if request.method == 'POST':
        username = request.POST['cust_name']
        email = request.POST['cust_email']
        pwd = request.POST['password']
        phn = request.POST['phn_no']

        if selected_lang == '1' and username:
            x = customer.objects.create(
                cust_name=username, email_id=email, password=pwd, phn_no=phn)
            x.save()
            return redirect("/")
        elif selected_lang == '2':
            x = manager.objects.create(
                manager_name=username, email_id=email, password=pwd, phn_no=phn)
            x.save()
            return redirect("/")
        elif selected_lang == '3':
            x = admin.objects.create(
                admin_name=username, email_id=email, password=pwd, phn_no=phn)
            x.save()
            return redirect("/")

    else:
        return render(request, 'SignUp.html')


def signactionbusiness(request):
    selected_city = request.POST.get('city')
    selected_type = request.POST.get('type')
    # email_1= request.POST['email2']
    # if request.method=='POST':
    #     otp=str(random.randint(100000,999999))
    #     send_mail(
    #                 'Confirmation of mail',
    #                 "Your OTP is  "+otp,
    #                 'mustkeem1310@gmail.com',
    #                 [email_1]
    #             )
    # return HttpResponseRedirect("")

    if request.method == 'POST' and request.FILES.get('photo'):
        username = request.POST['vname']
        localityname = request.POST['lname']
        descr = request.POST['desc']
        capac = request.POST['cap']
        ur = request.POST['url']
        cost1 = request.POST['cst']
        maname = request.POST['mname']
        con = request.POST['con_no']
        email_1 = request.POST['email2']
        file = request.FILES.get('photo')
        # otp1=request.POST['otp']
        fss = FileSystemStorage()

        # if otp1==otp:
        if selected_type == '1':
            x = hall.objects.create(hall_name=username, city=selected_city, locality=localityname, description=descr,
                                    contact_no=con, capacity=capac, url=ur, manager_name=maname, hall_email_id=email_1, cost=cost1, img=file)
            x.save()
            fss.save(file.name, file)
            return redirect("/")
        elif selected_type == '2':
            x = garden.objects.create(garden_name=username, city=selected_city, locality=localityname, description=descr,
                                      contact_no=con, capacity=capac, url=ur, manager_name=maname, garden_email_id=email_1, cost=cost1, img=file)
            x.save()
            fss.save(file.name, file)
            return redirect("/")
        elif selected_type == '3':
            x = pool.objects.create(pool_name=username, city=selected_city, locality=localityname, description=descr,
                                    contact_no=con, capacity=capac, url=ur, manager_name=maname, pool_email_id=email_1, cost=cost1, img=file)
            x.save()
            fss.save(file.name, file)
            return redirect("/")
        elif selected_type == '4':
            x = community_hall.objects.create(community_hall_name=username, city=selected_city, locality=localityname, description=descr,
                                              contact_no=con, capacity=capac, url=ur, manager_name=maname, community_hall_email_id=email_1, cost=cost1, img=file)
            x.save()
            fss.save(file.name, file)
            return redirect("/")
    else:
        return render(request, 'list.html')


def booking(request):
    if request.method == 'POST':
        name = request.POST.get('vn')
        vtype = request.POST.get('typ')
        username = request.POST['custn']
        phone = request.POST['phn']
        mail = request.POST['email']
        addre = request.POST['addr']
        dates = request.POST['dates']
        datef = request.POST['datef']
        if vtype == 'Hall':
            mailid = hall.objects.raw(
                'SELECT hall_id,hall_email_id FROM bookable1_hall WHERE hall_name=%s', [name])
            con = hall.objects.raw(
                'SELECT hall_id,contact_no FROM bookable1_hall WHERE hall_name=%s', [name])
            x = requested_hall.objects.create(
                vname=name, cus_name=username, phn_no=phone, eid=mail, address=addre, datestart=dates, dateend=datef, type=vtype)
            x.save()
            send_mail(
                'booking request confirmation',
                "This is to inform you that your request for booking of "+name +
                " is sent to the venue management, they will reach you shortly. For any query contact the given mail and contact no.: " +
                mailid[0].hall_email_id+"\n"+con[0].contact_no,
                'mustkeem1310@gmail.com',
                [mail]
            )
            return redirect("/")
        if vtype == 'Garden':
            mailid = garden.objects.raw(
                'SELECT garden_id,garden_email_id FROM bookable1_garden WHERE garden_name=%s', [name])
            con = garden.objects.raw(
                'SELECT garden_id,contact_no FROM bookable1_garden WHERE garden_name=%s', [name])
            x = requested_garden.objects.create(
                vname=name, cus_name=username, phn_no=phone, eid=mail, address=addre, datestart=dates, dateend=datef, type=vtype)
            x.save()
            send_mail(
                'booking request confirmation',
                "This is to inform you that your request for booking of "+name +
                " is sent to the venue management, they will reach you shortly. For any query contact the given mail and contact no.: " +
                mailid[0].garden_email_id+"\n"+con[0].contact_no,
                'mustkeem1310@gmail.com',
                [mail]
            )
            return redirect("/")
        if vtype == 'Pool':
            mailid = pool.objects.raw(
                'SELECT pool_id,pool_email_id FROM bookable1_pool WHERE pool_name=%s', [name])
            con = pool.objects.raw(
                'SELECT pool_id,contact_no FROM bookable1_pool WHERE pool_name=%s', [name])
            x = requested_pool.objects.create(
                vname=name, cus_name=username, phn_no=phone, eid=mail, address=addre, datestart=dates, dateend=datef, type=vtype)
            x.save()
            send_mail(
                'booking request confirmation',
                "This is to inform you that your request for booking of "+name +
                " is sent to the venue management, they will reach you shortly. For any query contact the given mail and contact no.: " +
                mailid[0].pool_email_id+"\n"+con[0].contact_no,
                'mustkeem1310@gmail.com',
                [mail]
            )
            return redirect("/")
        if vtype == 'Community_hall':
            mailid = community_hall.objects.raw(
                'SELECT community_hall_id,hall_email_id FROM bookable1_community_hall WHERE community_hall_name=%s', [name])
            con = community_hall.objects.raw(
                'SELECT community_hall_id,contact_no FROM bookable1_community_hall WHERE community_hall_name=%s', [name])
            x = requested_community_hall.objects.create(
                vname=name, cus_name=username, phn_no=phone, eid=mail, address=addre, datestart=dates, dateend=datef, type=vtype)
            x.save()
            send_mail(
                'booking request confirmation',
                "This is to inform you that your request for booking of "+name +
                " is sent to the venue management, they will reach you shortly. For any query contact the given mail and contact no.: " +
                mailid[0].community_hall_email_id+"\n"+con[0].contact_no,
                'mustkeem1310@gmail.com',
                [mail]
            )
            return redirect("/")

    return render(request, 'home.html')

    # customer_data=JSONParser().parse({'cust_name':"cust_name",'password':"password",'email_id':"cust_email",'phn_no':"phn_no"})
    # customers_serializer=customerSerializer(data=customer_data)
    # if customers_serializer.is_valid():
    #   customers_serializer.save()
    #   return JsonResponse("Added Successfully",safe=False)
    # return JsonResponse("Failed to Add",safe=False)
    # return render(request,'SignUp.html')
