#!/bin/bash

set -e 

user_name='opencm'
getent passwd | grep $user_name &>/dev/null || useradd -g wheel --home-dir /home/$user_name -m $user_name
getent passwd | grep $user_name &>/dev/null && echo $user_name | passwd $user_name --stdin
cat /etc/hosts | grep chef-srv &>/dev/null || echo "192.168.56.101 chef-srv" >> /etc/hosts


# we need git :)
[[ `which git` ]] || yum -y install git
