from django.db import models
from django.contrib.auth.models import User, Group

#def get_group_id(group):
#    groups = Group.objects.all().values()
        
#    for value in groups:
#        if value['name'] == group:
#            group_id = value['id']

#    return group_id


class Employee(models.Model):
    user = models.ForeignKey(User, unique = True, related_name = "%(class)s_employee")
    number = models.PositiveIntegerField(unique = True)
    date_created = models.DateTimeField(auto_now_add = True)
    date_modified = models.DateTimeField(auto_now = True)
    
    def __unicode__(self):
        return self.user.username

    class Meta:
        abstract = True

class Root(Employee):    
    group = models.ForeignKey(Group, default = 1, related_name = '%(class)s_group')

class Admin(Employee):
    group = models.ForeignKey(Group, default = 2, related_name = '%(class)s_group')

class Auditor(Employee):
    group = models.ForeignKey(Group, default = 3, related_name = '%(class)s_group')

class Cashier(Employee):
    group = models.ForeignKey(Group, default = 4, related_name = '%(class)s_group')

class Salesman(Employee):
    group = models.ForeignKey(Group, default = 5, related_name = '%(class)s_group')