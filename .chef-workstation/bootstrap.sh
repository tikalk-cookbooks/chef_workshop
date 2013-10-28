#!/bin/bash

set -e 
# install chef-solo
curl -L https://www.opscode.com/chef/install.sh | sudo bash

# add chef & embedded ruby to the path ...
echo PATH=$PATH:/opt/chef/bin:/opt/chef/embedded/bin > /etc/profile.d/ruby_n_chef.sh
chmod 0755 /etc/profile.d/ruby_n_chef.sh
source /etc/profile.d/ruby_n_chef.sh

gem install rubygems-update
update_rubygems
gem install librarian-chef

if [ "$1" = "server" ]; then
	# create required bootstrap dirs/files
	mkdir -p /var/chef/cache /var/chef/cookbooks/chef-server

	# pull down this chef-server cookbook
	wget -qO- https://github.com/opscode-cookbooks/chef-server/archive/master.tar.gz | tar xvzC /var/chef/cookbooks/chef-server --strip-components=1

	# install chef server with chef solo
	chef-solo -o 'recipe[chef-server::default]'
fi
