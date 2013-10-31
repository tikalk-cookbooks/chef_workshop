#!/bin/bash

set -e

user_name='opencm'
getent passwd | grep $user_name &>/dev/null || useradd --home-dir /home/$user_name -m $user_name
getent passwd | grep $user_name &>/dev/null && echo "$user_name:$user_name" | chpasswd
cat /etc/hosts | grep chef-srv &>/dev/null || echo "192.168.56.101 chef-srv" >> /etc/hosts
test -d /etc/sudoers.d/$user_name || echo "$user_name ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user_name
chmod 0440 /etc/sudoers.d/$user_name

# we need git on the image
[[ `which git` ]] || apt-get -yqq install git


# install chef-solo
curl -L https://www.opscode.com/chef/install.sh | sudo bash

# add chef & embedded ruby to the path ...
echo 'export PATH=$PATH:/opt/chef/bin:/opt/chef/embedded/bin' > /etc/profile.d/ruby_n_chef.sh
chmod 0755 /etc/profile.d/ruby_n_chef.sh
source /etc/profile.d/ruby_n_chef.sh


