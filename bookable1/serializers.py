from rest_framework import serializers
from bookable1.models import customer,manager,hall,garden,community_hall,pool

class customerSerializer(serializers.ModelSerializer):
    class Meta:
        model=customer
        fields=('cust_id','cust_name','password','email_id','phn_no')

class managerSerializer(serializers.ModelSerializer):
    class Meta:
        model=manager
        fields=('manager_id','manager_name','password','email_id','phn_no')

class hallSerializer(serializers.ModelSerializer):
    class Meta:
        model=hall
        fields=('hall_id','hall_name','city','locality','description','contact_no','manager_name','hall_email_id','cost')

class gardenSerializer(serializers.ModelSerializer):
    class Meta:
        model=garden
        fields=('garden_id','garden_name','city','locality','description','contact_no','manager_name','garden_email_id','cost')

class community_hallSerializer(serializers.ModelSerializer):
    class Meta:
        model=community_hall
        fields=('community_hall_id','community_hall_name','city','locality','description','contact_no','manager_name','community_hall_email_id','cost')

class poolSerializer(serializers.ModelSerializer):
    class Meta:
        model=pool
        fields=('pool_id','pool_name','city','locality','description','contact_no','manager_name','pool_email_id','cost')