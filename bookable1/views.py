from django.shortcuts import redirect, render
from django.views.decorators.csrf import csrf_exempt
from bookable1 import admin
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse

from bookable1.models import customer as cust, manager as man, hall as hll, garden as gar, community_hall as com, pool as pol, requested_hall, requested_garden, requested_pool, requested_community_hall, admin as ad, booked_halls, booked_gardens, booked_pools, booked_community_halls, queries as q, replies as r
from bookable1.serializers import customerSerializer, managerSerializer, hallSerializer, gardenSerializer, community_hallSerializer, poolSerializer
from django.core.files.storage import default_storage
from django.core.mail import send_mail

# Create your views here.


@csrf_exempt
def customerApi(request, id=0):
    if request.method == 'GET':
        customers = cust.objects.all()
        customers_serializer = customerSerializer(customers, many=True)
        return JsonResponse(customers_serializer.data, safe=False)
    elif request.method == 'POST':
        customer_data = JSONParser().parse(request)
        customers_serializer = customerSerializer(data=customer_data)
        if customers_serializer.is_valid():
            customers_serializer.save()
            return JsonResponse("Added Successfully", safe=False)
        return JsonResponse("Failed to Add", safe=False)
    elif request.method == 'PUT':
        customer_data = JSONParser().parse(request)
        customer = cust.objects.get(cust_id=customer_data['cust_id'])
        customers_serializer = customerSerializer(customer, data=customer_data)
        if customers_serializer.is_valid():
            customers_serializer.save()
            return JsonResponse("Updated Successfully", safe=False)
        return JsonResponse("Failed to Update")
    elif request.method == 'DELETE':
        customer = cust.objects.get(cust_id=id)
        customer.delete()
        return JsonResponse("Delete Successfully", safe=False)


@csrf_exempt
def managerApi(request, id=0):
    if request.method == 'GET':
        managers = man.objects.all()
        managers_serializer = managerSerializer(managers, many=True)
        return JsonResponse(managers_serializer.data, safe=False)
    elif request.method == 'POST':
        manager_data = JSONParser().parse(request)
        managers_serializer = managerSerializer(data=manager_data)
        if managers_serializer.is_valid():
            managers_serializer.save()
            return JsonResponse("Added Successfully", safe=False)
        return JsonResponse("Failed to Add", safe=False)
    elif request.method == 'PUT':
        manager_data = JSONParser().parse(request)
        manager = man.objects.get(manager_id=manager_data['manager_id'])
        managers_serializer = managerSerializer(manager, data=manager_data)
        if managers_serializer.is_valid():
            managers_serializer.save()
            return JsonResponse("Updated Successfully", safe=False)
        return JsonResponse("Failed to Update")
    elif request.method == 'DELETE':
        manager = man.objects.get(manager_id=id)
        manager.delete()
        return JsonResponse("Delete Successfully", safe=False)


@csrf_exempt
def hallApi(request, id=0):
    if request.method == 'GET':
        halls = hll.objects.all()
        halls_serializer = hallSerializer(halls, many=True)
        return JsonResponse(halls_serializer.data, safe=False)
    elif request.method == 'POST':
        hall_data = JSONParser().parse(request)
        halls_serializer = hallSerializer(data=hall_data)
        if halls_serializer.is_valid():
            halls_serializer.save()
            return JsonResponse("Added Successfully", safe=False)
        return JsonResponse("Failed to Add", safe=False)
    elif request.method == 'PUT':
        hall_data = JSONParser().parse(request)
        hall = hll.objects.get(hall_id=hall_data['hall_id'])
        hall_serializer = hallSerializer(hall, data=hall_data)
        if hall_serializer.is_valid():
            hall_serializer.save()
            return JsonResponse("Updated Successfully", safe=False)
        return JsonResponse("Failed to Update")
    elif request.method == 'DELETE':
        hall = hll.objects.get(hall_id=id)
        hall.delete()
        return JsonResponse("Delete Successfully", safe=False)


@csrf_exempt
def gardenApi(request, id=0):
    if request.method == 'GET':
        gardens = gar.objects.all()
        gardens_serializer = gardenSerializer(gardens, many=True)
        return JsonResponse(gardens_serializer.data, safe=False)
    elif request.method == 'POST':
        garden_data = JSONParser().parse(request)
        gardens_serializer = gardenSerializer(data=garden_data)
        if gardens_serializer.is_valid():
            gardens_serializer.save()
            return JsonResponse("Added Successfully", safe=False)
        return JsonResponse("Failed to Add", safe=False)
    elif request.method == 'PUT':
        garden_data = JSONParser().parse(request)
        garden = gar.objects.get(garden_id=garden_data['garden_id'])
        gardens_serializer = gardenSerializer(garden, data=garden_data)
        if gardens_serializer.is_valid():
            gardens_serializer.save()
            return JsonResponse("Updated Successfully", safe=False)
        return JsonResponse("Failed to Update")
    elif request.method == 'DELETE':
        garden = gar.objects.get(garden_id=id)
        garden.delete()
        return JsonResponse("Delete Successfully", safe=False)


@csrf_exempt
def community_hallApi(request, id=0):
    if request.method == 'GET':
        community_halls = com.objects.all()
        community_halls_serializer = community_hallSerializer(
            community_halls, many=True)
        return JsonResponse(community_halls_serializer.data, safe=False)
    elif request.method == 'POST':
        community_hall_data = JSONParser().parse(request)
        community_halls_serializer = community_hallSerializer(
            data=community_hall_data)
        if community_halls_serializer.is_valid():
            community_halls_serializer.save()
            return JsonResponse("Added Successfully", safe=False)
        return JsonResponse("Failed to Add", safe=False)
    elif request.method == 'PUT':
        community_hall_data = JSONParser().parse(request)
        community_hall = com.objects.get(
            community_hall_id=community_hall_data['community_hall_id'])
        community_halls_serializer = community_hallSerializer(
            community_hall, data=community_hall_data)
        if community_halls_serializer.is_valid():
            community_halls_serializer.save()
            return JsonResponse("Updated Successfully", safe=False)
        return JsonResponse("Failed to Update")
    elif request.method == 'DELETE':
        community_hall = com.objects.get(community_hall_id=id)
        community_hall.delete()
        return JsonResponse("Delete Successfully", safe=False)


@csrf_exempt
def poolApi(request, id=0):
    if request.method == 'GET':
        pools = pol.objects.all()
        pools_serializer = poolSerializer(pools, many=True)
        return JsonResponse(pools_serializer.data, safe=False)
    elif request.method == 'POST':
        pool_data = JSONParser().parse(request)
        pools_serializer = poolSerializer(data=pool_data)
        if pools_serializer.is_valid():
            pools_serializer.save()
            return JsonResponse("Added Successfully", safe=False)
        return JsonResponse("Failed to Add", safe=False)
    elif request.method == 'PUT':
        pool_data = JSONParser().parse(request)
        pool = pol.objects.get(pool_id=pool_data['pool_id'])
        pools_serializer = poolSerializer(pool, data=pool_data)
        if pools_serializer.is_valid():
            pools_serializer.save()
            return JsonResponse("Updated Successfully", safe=False)
        return JsonResponse("Failed to Update")
    elif request.method == 'DELETE':
        pool = pol.objects.get(pool_id=id)
        pool.delete()
        return JsonResponse("Delete Successfully", safe=False)


@csrf_exempt
def SaveFile(request):
    file = request.FILES['file']
    file_name = default_storage.save(file.name, file)
    return JsonResponse(file_name, safe=False)


def index(request):
    return render(request, 'index.html')


def list(request):
    return render(request, 'list.html')


def manager(request):
    hall_list = hll.objects.all()
    garden_list = gar.objects.all()
    pool_list = pol.objects.all()
    community_hall_list = com.objects.all()
    book_list = requested_hall.objects.filter(vname='')

    if request.method == 'POST':
        selected_venue = request.POST.get('venue')
        selected_type = request.POST.get('type')
        passw = request.POST['n']
        # book_list=booked.objects.filter(vname=selected_venue)

        if selected_type == 'hall':
            halld = hll.objects.raw(
                'SELECT hall_id,manager_name FROM bookable1_hall WHERE hall_name= %s', [selected_venue])
            p = man.objects.raw('SELECT manager_id,password FROM bookable1_manager WHERE manager_name=%s', [
                                halld[0].manager_name])
            # if passw==p[0].password:
            book_list = requested_hall.objects.filter(vname=selected_venue)

        elif selected_type == 'garden':
            gardend = gar.objects.raw(
                'SELECT garden_id,manager_name FROM bookable1_garden WHERE garden_name= %s', [selected_venue])
            p = man.objects.raw('SELECT manager_id,password FROM bookable1_manager WHERE manager_name=%s', [
                                gardend[0].manager_name])
            if passw == p[0].password:
                book_list = requested_garden.objects.filter(
                    vname=selected_venue)
        elif selected_type == 'pool':
            poold = pol.objects.raw(
                'SELECT pool_id,manager_name FROM bookable1_pool WHERE pool_name= %s', [selected_venue])
            p = man.objects.raw('SELECT manager_id,password FROM bookable1_manager WHERE manager_name=%s', [
                                poold[0].manager_name])
            if passw == p[0].password:
                book_list = requested_pool.objects.filter(vname=selected_venue)
        elif selected_type == 'community_hall':
            comd = com.objects.raw(
                'SELECT community_hall_id,manager_name FROM bookable1_community_hall WHERE community_hall_name= %s', [selected_venue])
            p = man.objects.raw('SELECT manager_id,password FROM bookable1_manager WHERE manager_name=%s', [
                                comd[0].manager_name])
            if passw == p[0].password:
                book_list = requested_community_hall.objects.filter(
                    vname=selected_venue)

    return render(request, 'Manger.html', {'hall_list': hall_list, 'garden_list': garden_list, 'pool_list': pool_list, 'community_hall_list': community_hall_list, 'book_list': book_list})


def accept(request):
    if request.method == 'POST':
        d = request.POST.get("vid")
        e = request.POST.get('ema')
        v = request.POST.get('vnm')
        typ = request.POST.get('type')
        booked_list = booked_halls.objects.filter(cus_name='')
        if typ == 'Hall':
            mailid = hll.objects.raw(
                'SELECT hall_id,hall_email_id FROM bookable1_hall WHERE hall_name=%s', [v])
            con = hll.objects.raw(
                'SELECT hall_id,contact_no FROM bookable1_hall WHERE hall_name=%s', [v])
            x = requested_hall.objects.raw(
                'SELECT * FROM bookable1_requested_hall WHERE id=%s', [d])
            if x:
                y = booked_halls.objects.create(cus_name=x[0].cus_name, phn_no=x[0].phn_no, eid=x[0].eid, address=x[0].address,
                                                datestart=x[0].datestart, dateend=x[0].dateend, vname=x[0].vname, type=x[0].type)
                y.save()
                booked_list = booked_halls.objects.all()
                a = requested_hall.objects.get(id=d)
                a.delete()
                send_mail(
                    'booking request confirmation',
                    "This is to inform you that your request for booking of "+v +
                    " is confirmed by venue management. For any further information contact the given mail and contact no.: " +
                    mailid[0].hall_email_id+"\n"+con[0].contact_no,
                    'mustkeem1310@gmail.com',
                    [e]
                )
                # return redirect('')
        if typ == 'Garden':
            mailid = gar.objects.raw(
                'SELECT garden_id,garden_email_id FROM bookable1_garden WHERE garden_name=%s', [v])
            con = gar.objects.raw(
                'SELECT garden_id,contact_no FROM bookable1_garden WHERE garden_name=%s', [v])
            x = requested_garden.objects.raw(
                'SELECT * FROM bookable1_requested_garden WHERE id=%s', [d])
            if x:
                y = booked_gardens.objects.create(cus_name=x[0].cus_name, phn_no=x[0].phn_no, eid=x[0].eid, address=x[0].address,
                                                  datestart=x[0].datestart, dateend=x[0].dateend, vname=x[0].vname, type=x[0].type)
                y.save()
                booked_list = booked_gardens.objects.all()
                a = requested_garden.objects.get(id=d)
                a.delete()
                send_mail(
                    'booking request confirmation',
                    "This is to inform you that your request for booking of "+v +
                    " is confirmed by venue management. For any further information contact the given mail and contact no.: " +
                    mailid[0].garden_email_id+"\n"+con[0].contact_no,
                    'mustkeem1310@gmail.com',
                    [e]
                )
                # return redirect('login')
        if typ == 'Pool':
            mailid = pol.objects.raw(
                'SELECT pool_id,pool_email_id FROM bookable1_pool WHERE pool_name=%s', [v])
            con = pol.objects.raw(
                'SELECT pool_id,contact_no FROM bookable1_pool WHERE pool_name=%s', [v])
            x = requested_pool.objects.raw(
                'SELECT * FROM bookable1_requested_pool WHERE id=%s', [d])
            if x:
                y = booked_pools.objects.create(cus_name=x[0].cus_name, phn_no=x[0].phn_no, eid=x[0].eid, address=x[0].address,
                                                datestart=x[0].datestart, dateend=x[0].dateend, vname=x[0].vname, type=x[0].type)
                y.save()
                booked_list = booked_pools.objects.all()
                a = requested_pool.objects.get(id=d)
                a.delete()
                send_mail(
                    'booking request confirmation',
                    "This is to inform you that your request for booking of "+v +
                    " is confirmed by venue management. For any further information contact the given mail and contact no.: " +
                    mailid[0].pool_id+"\n"+con[0].contact_no,
                    'mustkeem1310@gmail.com',
                    [e]
                )
                # return redirect('login')
        if typ == 'Community hall':
            mailid = com.objects.raw(
                'SELECT community_hall_id,community_hall_email_id FROM bookable1_community_hall WHERE community_hall_name=%s', [v])
            con = com.objects.raw(
                'SELECT community_hall_id,contact_no FROM bookable1_community_hall WHERE community_hall_name=%s', [v])
            x = requested_community_hall.objects.raw(
                'SELECT * FROM bookable1_requested_community_hall WHERE id=%s', [d])
            if x:
                y = booked_community_halls.objects.create(cus_name=x[0].cus_name, phn_no=x[0].phn_no, eid=x[0].eid,
                                                          address=x[0].address, datestart=x[0].datestart, dateend=x[0].dateend, vname=x[0].vname, type=x[0].type)
                y.save()
                booked_list = booked_community_halls.objects.all()
                a = requested_community_hall.objects.get(id=d)
                a.delete()
                send_mail(
                    'booking request confirmation',
                    "This is to inform you that your request for booking of "+v +
                    " is confirmed by venue management. For any further information contact the given mail and contact no.: " +
                    mailid[0].community_hall_email_id+"\n"+con[0].contact_no,
                    'mustkeem1310@gmail.com',
                    [e]
                )
                # return redirect('login')

    return render(request, 'Manger.html', {'booked_list': booked_list})


def adds(request):
    return render(request, 'add.html')


def book(request):
    return render(request, 'book.html')


def listing(request):
    hall_list = hll.objects.all()
    garden_list = gar.objects.all()
    pool_list = pol.objects.all()
    community_hall_list = com.objects.all()

    if request.method == 'POST':
        selected_place = request.POST.get('place')
        selected_type = request.POST.get('type')
        selected_cap = request.POST.get('cap')
        if selected_cap == '1':
            hall_list = hll.objects.raw(
                'SELECT * FROM bookable1_hall WHERE capacity<1000')
            garden_list = gar.objects.raw(
                'SELECT * FROM bookable1_garden WHERE capacity<1000')
            pool_list = pol.objects.raw(
                'SELECT * FROM bookable1_pool WHERE capacity<1000')
            community_hall_list = com.objects.raw(
                'SELECT * FROM bookable1_community_hall WHERE capacity<1000')
        elif selected_cap == '2':
            hall_list = hll.objects.raw(
                'SELECT * FROM bookable1_hall WHERE capacity BETWEEN 1000 AND 2000')
            garden_list = gar.objects.raw(
                'SELECT * FROM bookable1_garden WHERE capacity BETWEEN 1000 AND 2000')
            pool_list = pol.objects.raw(
                'SELECT * FROM bookable1_pool WHERE capacity BETWEEN 1000 AND 2000')
            community_hall_list = com.objects.raw(
                'SELECT * FROM bookable1_community_hall WHERE capacity BETWEEN 1000 AND 2000')
        elif selected_cap == '3':
            hall_list = hll.objects.raw(
                'SELECT * FROM bookable1_hall WHERE capacity BETWEEN 2000 AND 3000')
            garden_list = gar.objects.raw(
                'SELECT * FROM bookable1_garden WHERE capacity BETWEEN 2000 AND 3000')
            pool_list = pol.objects.raw(
                'SELECT * FROM bookable1_pool WHERE capacity BETWEEN 2000 AND 3000')
            community_hall_list = com.objects.raw(
                'SELECT * FROM bookable1_community_hall WHERE capacity BETWEEN 2000 AND 3000')
        elif selected_cap == '4':
            hall_list = hll.objects.raw(
                'SELECT * FROM bookable1_hall WHERE capacity BETWEEN 3000 AND 4000')
            garden_list = gar.objects.raw(
                'SELECT * FROM bookable1_garden WHERE capacity BETWEEN 3000 AND 4000')
            pool_list = pol.objects.raw(
                'SELECT * FROM bookable1_pool WHERE capacity BETWEEN 3000 AND 4000')
            community_hall_list = com.objects.raw(
                'SELECT * FROM bookable1_community_hall WHERE capacity BETWEEN 3000 AND 4000')
        elif selected_cap == '5':
            hall_list = hll.objects.raw(
                'SELECT * FROM bookable1_hall WHERE capacity BETWEEN 4000 AND 5000')
            garden_list = gar.objects.raw(
                'SELECT * FROM bookable1_garden WHERE capacity BETWEEN 4000 AND 5000')
            pool_list = pol.objects.raw(
                'SELECT * FROM bookable1_pool WHERE capacity BETWEEN 4000 AND 5000')
            community_hall_list = com.objects.raw(
                'SELECT * FROM bookable1_community_hall WHERE capacity BETWEEN 4000 AND 5000')
        elif selected_cap == '6':
            hall_list = hll.objects.raw(
                'SELECT * FROM bookable1_hall WHERE capacity>5000')
            garden_list = gar.objects.raw(
                'SELECT * FROM bookable1_garden WHERE capacity>5000')
            pool_list = pol.objects.raw(
                'SELECT * FROM bookable1_pool WHERE capacity>5000')
            community_hall_list = com.objects.raw(
                'SELECT * FROM bookable1_community_hall WHERE capacity>5000')

        if selected_type == 'hall' and selected_cap == '1':
            hall_list = hll.objects.raw(
                'SELECT * FROM bookable1_hall WHERE city=%s AND capacity<1000', [selected_place])
            garden_list = {}
            pool_list = {}
            community_hall_list = {}
        elif selected_type == 'hall' and selected_cap == '2':
            hall_list = hll.objects.raw(
                'SELECT * FROM bookable1_hall WHERE city=%s AND capacity BETWEEN 1000 AND 2000', [selected_place])
            garden_list = {}
            pool_list = {}
            community_hall_list = {}
        elif selected_type == 'hall' and selected_cap == '3':
            hall_list = hll.objects.raw(
                'SELECT * FROM bookable1_hall WHERE city=%s AND capacity BETWEEN 2000 AND 3000', [selected_place])
            garden_list = {}
            pool_list = {}
            community_hall_list = {}
        elif selected_type == 'hall' and selected_cap == '4':
            hall_list = hll.objects.raw(
                'SELECT * FROM bookable1_hall WHERE city=%s AND capacity BETWEEN 3000 AND 4000', [selected_place])
            garden_list = {}
            pool_list = {}
            community_hall_list = {}
        elif selected_type == 'hall' and selected_cap == '5':
            hall_list = hll.objects.raw(
                'SELECT * FROM bookable1_hall WHERE city=%s AND capacity BETWEEN 4000 AND 5000', [selected_place])
            garden_list = {}
            pool_list = {}
            community_hall_list = {}
        elif selected_type == 'hall' and selected_cap == '6':
            hall_list = hll.objects.raw(
                'SELECT * FROM bookable1_hall WHERE city=%s AND capacity>5000', [selected_place])
            garden_list = {}
            pool_list = {}
            community_hall_list = {}

        if selected_type == 'garden' and selected_cap == '1':
            garden_list = gar.objects.raw(
                'SELECT * FROM bookable1_garden WHERE city=%s AND capacity<1000', [selected_place])
            hall_list = {}
            pool_list = {}
            community_hall_list = {}
        elif selected_type == 'garden' and selected_cap == '2':
            garden_list = gar.objects.raw(
                'SELECT * FROM bookable1_garden WHERE city=%s AND capacity BETWEEN 1000 AND 2000', [selected_place])
            hall_list = {}
            pool_list = {}
            community_hall_list = {}
        elif selected_type == 'garden' and selected_cap == '3':
            garden_list = gar.objects.raw(
                'SELECT * FROM bookable1_garden WHERE city=%s AND capacity BETWEEN 2000 AND 3000', [selected_place])
            hall_list = {}
            pool_list = {}
            community_hall_list = {}
        elif selected_type == 'garden' and selected_cap == '4':
            garden_list = gar.objects.raw(
                'SELECT * FROM bookable1_garden WHERE city=%s AND capacity BETWEEN 3000 AND 4000', [selected_place])
            hall_list = {}
            pool_list = {}
            community_hall_list = {}
        elif selected_type == 'garden' and selected_cap == '5':
            garden_list = gar.objects.raw(
                'SELECT * FROM bookable1_garden WHERE city=%s AND capacity BETWEEN 4000 AND 5000', [selected_place])
            hall_list = {}
            pool_list = {}
            community_hall_list = {}
        elif selected_type == 'garden' and selected_cap == '6':
            garden_list = gar.objects.raw(
                'SELECT * FROM bookable1_garden WHERE city=%s AND capacity>5000', [selected_place])
            hall_list = {}
            pool_list = {}
            community_hall_list = {}

        if selected_type == 'pool' and selected_cap == '1':
            pool_list = pol.objects.raw(
                'SELECT * FROM bookable1_pool WHERE city=%s AND capacity<1000', [selected_place])
            hall_list = {}
            garden_list = {}
            community_hall_list = {}
        elif selected_type == 'pool' and selected_cap == '2':
            pool_list = pol.objects.raw(
                'SELECT * FROM bookable1_pool WHERE city=%s AND capacity BETWEEN 1000 AND 2000', [selected_place])
            hall_list = {}
            garden_list = {}
            community_hall_list = {}
        elif selected_type == 'pool' and selected_cap == '3':
            pool_list = pol.objects.raw(
                'SELECT * FROM bookable1_pool WHERE city=%s AND capacity BETWEEN 2000 AND 3000', [selected_place])
            hall_list = {}
            garden_list = {}
            community_hall_list = {}
        elif selected_type == 'pool' and selected_cap == '4':
            pool_list = pol.objects.raw(
                'SELECT * FROM bookable1_pool WHERE city=%s AND capacity BETWEEN 3000 AND 4000', [selected_place])
            hall_list = {}
            garden_list = {}
            community_hall_list = {}
        elif selected_type == 'pool' and selected_cap == '5':
            pool_list = pol.objects.raw(
                'SELECT * FROM bookable1_pool WHERE city=%s AND capacity BETWEEN 4000 AND 5000', [selected_place])
            hall_list = {}
            garden_list = {}
            community_hall_list = {}
        elif selected_type == 'pool' and selected_cap == '6':
            pool_list = pol.objects.raw(
                'SELECT * FROM bookable1_pool WHERE city=%s AND capacity>5000', [selected_place])
            hall_list = {}
            garden_list = {}
            community_hall_list = {}

        if selected_type == 'community_hall' and selected_cap == '1':
            community_hall_list = com.objects.raw(
                'SELECT * FROM bookable1_community_hall WHERE city=%s AND capacity<1000', [selected_place])
            hall_list = {}
            garden_list = {}
            pool_list = {}
        elif selected_type == 'community_hall' and selected_cap == '2':
            community_hall_list = com.objects.raw(
                'SELECT * FROM bookable1_community_hall WHERE city=%s AND capacity BETWEEN 1000 AND 2000', [selected_place])
            hall_list = {}
            garden_list = {}
            pool_list = {}
        elif selected_type == 'community_hall' and selected_cap == '3':
            community_hall_list = com.objects.raw(
                'SELECT * FROM bookable1_community_hall WHERE city=%s AND capacity BETWEEN 2000 AND 3000', [selected_place])
            hall_list = {}
            garden_list = {}
            pool_list = {}
        elif selected_type == 'community_hall' and selected_cap == '4':
            community_hall_list = com.objects.raw(
                'SELECT * FROM bookable1_community_hall WHERE city=%s AND capacity BETWEEN 3000 AND 4000', [selected_place])
            hall_list = {}
            garden_list = {}
            pool_list = {}
        elif selected_type == 'community_hall' and selected_cap == '5':
            community_hall_list = com.objects.raw(
                'SELECT * FROM bookable1_community_hall WHERE city=%s AND capacity BETWEEN 4000 AND 5000', [selected_place])
            hall_list = {}
            garden_list = {}
            pool_list = {}
        elif selected_type == 'community_hall' and selected_cap == '6':
            community_hall_list = com.objects.raw(
                'SELECT * FROM bookable1_community_hall WHERE city=%s AND capacity>5000', [selected_place])
            hall_list = {}
            garden_list = {}
            pool_list = {}

    return render(request, 'home.html', {'hall_list': hall_list, 'garden_list': garden_list, 'pool_list': pool_list, 'community_hall_list': community_hall_list})


def login(request):
    selected_type = request.POST.get('check')
    if request.method == 'POST':
        email1 = request.POST['email']
        pwd = request.POST['password']

        if selected_type == '1':
            x = cust.objects.filter(email_id=email1, password=pwd)
            if not x:
                return redirect('')
            else:
                hall_list = hll.objects.all()
                garden_list = gar.objects.all()
                pool_list = pol.objects.all()
                community_hall_list = com.objects.all()
                return redirect('/home.html') and render(request, 'home.html', {'hall_list': hall_list, 'garden_list': garden_list, 'pool_list': pool_list, 'community_hall_list': community_hall_list})
        elif selected_type == '2':
            x = man.objects.filter(email_id=email1, password=pwd)
            if not x:
                return redirect('')
            else:
                hall_list = hll.objects.all()
                garden_list = gar.objects.all()
                pool_list = pol.objects.all()
                community_hall_list = com.objects.all()
                book_list = requested_hall.objects.filter(vname='')
                return redirect('/manager.html') and render(request, 'Manger.html', {'hall_list': hall_list, 'garden_list': garden_list, 'pool_list': pool_list, 'community_hall_list': community_hall_list, 'book_list': book_list})
        elif selected_type == '3':
            x = ad.objects.filter(email_id=email1, password=pwd)
            if not x:
                return redirect('')
            else:
                hall_list = hll.objects.all()
                garden_list = gar.objects.all()
                pool_list = pol.objects.all()
                community_hall_list = com.objects.all()

                return redirect('/admin.html') and render(request, 'admin.html', {'hall_list': hall_list, 'garden_list': garden_list, 'pool_list': pool_list, 'community_hall_list': community_hall_list})


def adbook(request):
    hall_list = booked_halls.objects.all()
    garden_list = booked_gardens.objects.all()
    pool_list = booked_pools.objects.all()
    community_hall_list = booked_community_halls.objects.all()

    return render(request, 'admin-bookings.html', {'hall_list': hall_list, 'garden_list': garden_list, 'pool_list': pool_list, 'community_hall_list': community_hall_list})


def adm(request):
    hall_list = hll.objects.all()
    garden_list = gar.objects.all()
    pool_list = pol.objects.all()
    community_hall_list = com.objects.all()
    if request.method == 'POST':
        selected_type = request.POST.get('type')
        selected_id = int(request.POST.get('id'))

        if selected_type == 'hall':
            x = hll.objects.get(hall_id=selected_id)
            x.delete()
            hall_list = hll.objects.all()

        if selected_type == 'garden':
            x = gar.objects.get(garden_id=selected_id)
            x.delete()
            garden_list = gar.objects.all()

        if selected_type == 'pool':
            x = pol.objects.get(pool_id=selected_id)
            x.delete()
            pool_list = pol.objects.all()

        if selected_type == 'community_hall':
            x = com.objects.get(community_hall_id=selected_id)
            x.delete()
            community_hall_list = com.objects.all()
        return redirect('/') and render(request, 'admin.html', {'hall_list': hall_list, 'garden_list': garden_list, 'pool_list': pool_list, 'community_hall_list': community_hall_list})


def queries(request):
    qu = q.objects.all()
    if request.method == 'POST':
        reply = request.POST['reply']
        id = request.POST.get('id')
        email = request.POST.get('email')
        que = request.POST.get('query')
        m = 'mustkeem1310@gmail.com'
        send_mail(
            'Reply of your Query',
            reply+"\nFor any further queries send reply on \n"+m,
            'mustkeem1310@gmail.com',
            [email]
        )
        a = r.objects.create(email=email, query=que, reply=reply)
        a.save
        x = q.objects.get(id=id)
        x.delete()
        qu = q.objects.all()
    return render(request, 'queries.html', {'query_list': qu})


def qu(request):
    if request.method == 'POST':
        email = request.POST['eme']
        text = request.POST['txt']
        x = q.objects.create(email=email, query=text)
        x.save()
    return render(request, 'home.html')
