#!/bin/bash


 if [[ $EUID -ne 0 ]]; then
      echo -e "$error This script must be run as root\n$info You could also run: sudo $0" 1>&2
      exit 1
  fi

# install chef ...
curl -L https://www.opscode.com/chef/install.sh | sudo bash

# add chef & embedded ruby to the path ...
test -f /etc/profile.d/ruby_n_chef.sh || echo PATH=$PATH:/opt/chef/bin:/opt/chef/embedded/bin > /etc/profile.d/ruby_n_chef.sh
chmod 0755 /etc/profile.d/ruby_n_chef.sh
echo $PATH | grep "chef" || source /etc/profile.d/ruby_n_chef.sh

# update ruby gems ( chef shipps with 1.8.x need 2.1.x and above )
gem install rubygems-update
update_rubygems

which bundle &>/dev/null || { gem insmtall bundler; } && { bundle install; }

# generate pem file for user
test -f .chef/$USER.pem || ssh-keygen -f .chef/$USER.pem

# validate all gem-deps are installed ...
for gem in `cat Gemfile | grep "^gem"  | sed -s 's/"//g;s/gem //g'`; do gem list | grep $gem &>/dev/null && echo "$gem found"; done
