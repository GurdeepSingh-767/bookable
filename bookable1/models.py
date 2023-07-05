from django.db import models

# Create your models here.

class customer(models.Model):
    cust_id= models.AutoField(primary_key=True)
    cust_name= models.CharField(max_length=500)
    password= models.CharField(max_length=500)
    email_id=models.CharField(max_length=500)
    phn_no=models.CharField(max_length=500)

class manager(models.Model):
    manager_id= models.AutoField(primary_key=True)
    manager_name= models.CharField(max_length=500)
    password= models.CharField(max_length=500)
    email_id=models.CharField(max_length=500)
    phn_no=models.CharField(max_length=500)

class admin(models.Model):
    admin_id= models.AutoField(primary_key=True)
    admin_name= models.CharField(max_length=500)
    password= models.CharField(max_length=500)
    email_id=models.CharField(max_length=500)
    phn_no=models.CharField(max_length=500) 

class hall(models.Model):
    hall_id= models.AutoField(primary_key=True)
    hall_name= models.CharField(max_length=500)
    city= models.CharField(max_length=500)
    locality=models.CharField(max_length=500)
    description=models.CharField(max_length=1500)
    contact_no=models.CharField(max_length=500)
    capacity=models.CharField(max_length=500)
    url=models.CharField(max_length=500)
    manager_name=models.CharField(max_length=500)
    hall_email_id=models.CharField(max_length=500)
    cost=models.PositiveIntegerField()  
    img=models.ImageField(upload_to='Photos/') 

class garden(models.Model):
    garden_id= models.AutoField(primary_key=True)
    garden_name= models.CharField(max_length=1500)
    city= models.CharField(max_length=500)
    locality=models.CharField(max_length=500)
    description=models.CharField(max_length=1500)
    contact_no=models.CharField(max_length=500)
    capacity=models.CharField(max_length=500)
    url=models.CharField(max_length=500)
    manager_name=models.CharField(max_length=500)
    garden_email_id=models.CharField(max_length=500)
    cost=models.PositiveIntegerField()
    img=models.ImageField(upload_to='Photos/')

class community_hall(models.Model):
    community_hall_id= models.AutoField(primary_key=True)
    community_hall_name= models.CharField(max_length=500)
    city= models.CharField(max_length=500)
    locality=models.CharField(max_length=500)
    description=models.CharField(max_length=1500)
    contact_no=models.CharField(max_length=500)
    capacity=models.CharField(max_length=500)
    url=models.CharField(max_length=500)
    manager_name=models.CharField(max_length=500)
    community_hall_email_id=models.CharField(max_length=500)
    cost=models.PositiveIntegerField()
    img=models.ImageField(upload_to='Photos/')  

class pool(models.Model):
    pool_id= models.AutoField(primary_key=True)
    pool_name= models.CharField(max_length=500)
    city= models.CharField(max_length=500)
    locality=models.CharField(max_length=500)
    description=models.CharField(max_length=1500)
    contact_no=models.CharField(max_length=500)
    capacity=models.CharField(max_length=500)
    url=models.CharField(max_length=500)
    manager_name=models.CharField(max_length=500)
    pool_email_id=models.CharField(max_length=500)
    cost=models.PositiveIntegerField() 
    img=models.ImageField(upload_to='Photos/')


class requested_hall(models.Model):
    cus_name=models.CharField(max_length=500)
    phn_no=models.CharField(max_length=500)
    eid=models.CharField(max_length=500)
    type=models.CharField(max_length=200,default=None)
    address=models.CharField(max_length=750)
    datestart=models.DateField(default=None)
    dateend=models.DateField(default=None)
    vname=models.CharField(max_length=500)

class requested_garden(models.Model):
    cus_name=models.CharField(max_length=500)
    phn_no=models.CharField(max_length=500)
    eid=models.CharField(max_length=500)
    type=models.CharField(max_length=200,default=None)
    address=models.CharField(max_length=750)
    datestart=models.DateField(default=None)
    dateend=models.DateField(default=None)
    vname=models.CharField(max_length=500)


class requested_pool(models.Model):
    cus_name=models.CharField(max_length=500)
    phn_no=models.CharField(max_length=500)
    eid=models.CharField(max_length=500)
    type=models.CharField(max_length=200,default=None)
    address=models.CharField(max_length=750)
    datestart=models.DateField(default=None)
    dateend=models.DateField(default=None)
    vname=models.CharField(max_length=500)


class requested_community_hall(models.Model):
    cus_name=models.CharField(max_length=500)
    phn_no=models.CharField(max_length=500)
    eid=models.CharField(max_length=500)
    type=models.CharField(max_length=200,default=None)
    address=models.CharField(max_length=750)
    datestart=models.DateField(default=None)
    dateend=models.DateField(default=None)
    vname=models.CharField(max_length=500)


class booked_halls(models.Model):
    cus_name=models.CharField(max_length=500)
    phn_no=models.CharField(max_length=500)
    eid=models.CharField(max_length=500)
    type=models.CharField(max_length=200,default=None)
    address=models.CharField(max_length=750)
    datestart=models.DateField(default=None)
    dateend=models.DateField(default=None)
    vname=models.CharField(max_length=500)

class booked_pools(models.Model):
    cus_name=models.CharField(max_length=500)
    phn_no=models.CharField(max_length=500)
    eid=models.CharField(max_length=500)
    type=models.CharField(max_length=200,default=None)
    address=models.CharField(max_length=750)
    datestart=models.DateField(default=None)
    dateend=models.DateField(default=None)
    vname=models.CharField(max_length=500)

class booked_gardens(models.Model):
    cus_name=models.CharField(max_length=500)
    phn_no=models.CharField(max_length=500)
    eid=models.CharField(max_length=500)
    type=models.CharField(max_length=200,default=None)
    address=models.CharField(max_length=750)
    datestart=models.DateField(default=None)
    dateend=models.DateField(default=None)
    vname=models.CharField(max_length=500)

class booked_community_halls(models.Model):
    cus_name=models.CharField(max_length=500)
    phn_no=models.CharField(max_length=500)
    eid=models.CharField(max_length=500)
    type=models.CharField(max_length=200,default=None)
    address=models.CharField(max_length=750)
    datestart=models.DateField(default=None)
    dateend=models.DateField(default=None)
    vname=models.CharField(max_length=500)



class queries(models.Model):
    email=models.CharField(max_length=500)
    query=models.CharField(max_length=1500)



class replies(models.Model):
    email=models.CharField(max_length=500)
    query=models.CharField(max_length=1500)
    reply=models.CharField(max_length=1500)


    # venue_name=models.CharField(foreign_key=pool.pool_name)