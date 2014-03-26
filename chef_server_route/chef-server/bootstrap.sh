#!/bin/bash

set -e 
# install chef-solo
[[ `which chef-solo` ]] || { curl -L https://www.opscode.com/chef/install.sh | sudo bash; } && { echo 'chef client / solo found, continuing ...'; }

# add chef & embedded ruby to the path ...
echo 'export PATH=$PATH:/opt/chef/bin:/opt/chef/embedded/bin' > /etc/profile.d/ruby_n_chef.sh
chmod 0755 /etc/profile.d/ruby_n_chef.sh
source /etc/profile.d/ruby_n_chef.sh

if [ "$1" = "server" ]; then
	# create required bootstrap dirs/files
	[[ -d /var/chef/cookbooks/chef-server ]] || mkdir -p /var/chef/cache /var/chef/cookbooks/chef-server

	# pull down this chef-server cookbook
	# wget -qO- https://github.com/opscode-cookbooks/chef-server/archive/master.tar.gz | tar xvzC /var/chef/cookbooks/chef-server --strip-components=1
	# master has now changes and requires berkshlf to be installed - I don't want that complication at this stage ...
	chef_server_ver='2.0.0'
	[[ -f /var/chef/cookbooks/chef-server/metadata.rb ]] && cheferv_avail=`cat /var/chef/cookbooks/chef-server/metadata.rb | grep ${chef_server_ver}`
	[[ "x${cheferv_avail}" != "x" ]]  || \
		{ wget -qO- https://github.com/opscode-cookbooks/chef-server/archive/2.0.0.tar.gz | \
	  tar xvzC /var/chef/cookbooks/chef-server --strip-components=1; } && { echo "found chef-server ${chef_server_ver} @ /var/chef/cookbooks/chef-server"; }

	# install chef server with chef solo
	chef-solo -o 'recipe[chef-server::default]'
fi


