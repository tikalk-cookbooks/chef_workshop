#!/bin/bash

[[ -z "$DEBUG" ]] && set -x #|| set -e

# we need git on the image to set the cookbook path in knife.rb
[[ `which git` ]] || apt-get -y install git
# clone the repo ... [myself :)]

[[ -d /root/chef_repo ]] || git clone https://github.com/tikalk-cookbooks/chef-intro-repo.git /root/chef_repo
cd /etc/bash_completion.d/ 
[[ -f knife.sh ]] || wget https://gist.github.com/raw/1050685/23624fff40694d5ed5f55089774d13b1937bb37f/knife.sh


fmt <<'EOF'

====================================================================================
  Now you should configure knife
====================================================================================

  - Connect now with "vagrant ssh" become root with sudo -i

  - Provide knife with the desired username/pass - the chef-server will generate it for you !

  - Provide knife the cookbook_path of "/root/chef_repo/cookbooks"

    ** To test your configuration you can run	**

    ** knife-client list ...			**
  
HINT :: use the following command
    knife configure --admin-client-name admin --admin-client-key \
	/etc/chef-server/admin.pem -i -r /root/chef_repo/ \
	--validation-client-name chef-validator --validation-key \
	/etc/chef-server/chef-validator.pem

PLEASE NOTE::
	This is for educational puposes and normally we will not use root !
	(In this case in order to configure knife and keep things simple I used root which has permitions to access /chef-server/*.pem)

Add roles & cookbooks to the server and bootstrap your node.

	Add a role to your server :: 

	  knife role from file roles/base.json

	Upload the cookbooks to the server :: 

	  knife cookbook upload ntp 

	  knife cookbook upload chef-client
	
	Bootstrap a node:
	
	centos node :: knife bootstrap 192.168.56.103 -x opencm -P opencm \
	-r 'role[base]' --sudo

	ubtunu node :: knife bootstrap 192.168.56.104 -x opencm -P opencm \	   -r 'role[base]' --sudo


====================================================================================

EOF

