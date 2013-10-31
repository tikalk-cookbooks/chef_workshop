#!/bin/bash

set -e 

user_name='opencm'
getent passwd | grep $user_name &>/dev/null || useradd -g wheel --home-dir /home/$user_name -m $user_name
getent passwd | grep $user_name &>/dev/null && echo $user_name | passwd $user_name --stdin
cat /etc/hosts | grep chef-srv &>/dev/null || echo "192.168.56.101 chef-srv" >> /etc/hosts


# we need git :)
[[ `which git` ]] || apt-get -yqq install git

# install chef-solo
`which chef-solo` || curl -L https://www.opscode.com/chef/install.sh | sudo bash

# add chef & embedded ruby to the path ...
test -f /etc/profile.d/ruby_n_chef.sh ||  echo 'export PATH=$PATH:/opt/chef/bin:/opt/chef/embedded/bin' > /etc/profile.d/ruby_n_chef.sh
chmod 0755 /etc/profile.d/ruby_n_chef.sh
echo $PATH | grep "chef" || source /etc/profile.d/ruby_n_chef.sh

gem install rubygems-update
update_rubygems
gem install librarian-chef --no-document --no-ri --no-rdoc
