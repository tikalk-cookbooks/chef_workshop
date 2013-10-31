###Purpose - using chef server
1. create a chef server
2. create a centos node
3. create a ubutnu node
4. assign a role to the nodes via chef bootstrap


###Provided machines via vagrant


| Directory | Purpose |
|:------------- |:------------- |
|`├── chef_server_route`|		__A set of machines__ for the `server route`|
|`│   ├── centos_node`|			A centos node for this lab based on [CentOS 6.4 x86_64][CentOS 6.4 x86_64]|
|`│   │   ├── Vagrantfile`| 	A [vagrant][vagrant] file which instatiates this machine with VirtualBox provider|
|`│   │   └── bootstrap.sh`|	A Shell script which customizes this machine for the chef server part of the workshop|
|`│   ├── chef-server`|			The chef server folder ... based on [canonical-ubuntu-12.04][canonical-ubuntu-12.04]|
|`│   │   ├── Vagrantfile`|		A [vagrant][vagrant] file which instatiates this machine with VirtualBox provider|
|`│   │   ├── bootstrap.sh`|	A Shell script which customizes this machine for the `chef server` route of the workshop|
|`│   │   └── knife-config.sh`|A guided [knife][knife] configuration + cusomiztion|
|`│   └── ubutnu_node`|			A ubutnu node ... based on [canonical-ubuntu-12.04][canonical-ubuntu-12.04]|
|`│       ├── Vagrantfile`|		A [vagrant][vagrant] file which instatiates this machine with VirtualBox provider|
|`│       └── bootstrap.sh`|	A Shell script which customizes this machine for the chef server route of the workshop|



###chef server route:

Bootstrap your chef server:

	cd .chef-server
	vagrant up
	vagrant provision

At this stage you have a chef server listening on address `192.168.56.101`

A __chef_repo__ cloned from: `https://github.com/tikalk-cookbooks/chef-intro-repo.git` into `/root/chef_repo`

Configure [knife][knife] on your chef server - a.k.a `knife workstation`
connect to the chef server with vagrant
	
	vagrant ssh
	
Become root
	
	sudo -i

Setup knife, when prompted provide a username & password for the new user [ user used by knife … ]

	knife configure --admin-client-name admin --admin-client-key /etc/chef-server/admin.pem -i -r /root/chef_repo/ --validation-client-name chef-validator --validation-key /etc/chef-server/chef-validator.pem

After configuring `knife` let's push a `role` and some `cookbooks` into the __chef-server__

	knife cookbook upload ntp
	
	knife cookbook upload chef-client
	
We are noew ready for cooking with chef-server.


Knife is ready we are now ready to bootstrap some nodes in our infrustructure so lets create some first:

1. centos node
	
	cd .centos_node
	vagrant up
	
	You have a cnetos machine listening on `192.168.56.103` [ see .centos_node/Vagrantfile ]
	
2. ubutnu node

	cd .ubuntu_node
	vagrant up
	
	You have a ubuntu machine listening on `192.168.56.104` [ see .ubuntu_node/Vagrantfile ]

So now we have nodes let's provision them …

centos node :: 

	knife bootstrap 192.168.56.103 -x opencm -P opencm -r 'role[base]' --sudo

ubtunu node :: 

	knife bootstrap 192.168.56.104 -x opencm -P opencm -r 'role[base]' --sudo

Please note the bootstrap.sh in the folder of each node add a user called opencm with a similar password …

You should now have two nodes which are tied to a chef-server !
And were applied to run both chef-client and a basic ntp cookbook.
