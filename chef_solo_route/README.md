###Purpose - Using chef solo

<img src="http://www.tikalk.com/files/upload/1/chef_southpark.jpg" alt="Chef south park" height="120" width="120"  hspace="20" align="left"> 
1. Create a node(s)<br>
2. Provision it with chef

<br>
<br>
<br>
__End goal:__ understand the ***workflow*** with a chef-solo.
<br>
###Provided machines via vagrant

| Directory | Purpose |
|:------------- |:------------- |
|`├── chef_solo_route`|			__A set of machines__ for the `chef-solo route`|
|`│   ├── centos_node`|			A centos node for this lab based on [CentOS 6.4 x86_64][CentOS 6.4 x86_64] some more stuff for chef-solo|
|`│   │   ├── Vagrantfile`|		A [vagrant][vagrant] file which instatiates this machine with VirtualBox provider|
|`│   │   └── bootstrap.sh`|	A Shell script which customizes this machine for the `chef solo` route of the workshop|
|`│   └── ubutnu_node`|			A ubutnu node ... based on [canonical-ubuntu-12.04][canonical-ubuntu-12.04]|
|`│       ├── Vagrantfile`|		A [vagrant][vagrant] file which instatiates this machine with VirtualBox provider|
|`│       └── bootstrap.sh`|	A Shell script which customizes this machine for the `chef solo` route of the workshop|
|`├── Cheffile`|				The chef cookbooks / dependencies used in the chef-solo part of the workshop|
|`├── nodes`|					Chef node objects user in `chef solo` route |
|`│   ├── db.json`| 			A database node exmaple|
|`│   └── default.json`|		A default node - basically will run the default role see `roles` dir below|
|`├── roles`|					Chef `role` objects as files in `chef solo` route|
|`│   ├── db.rb`|				The datbase `role`|
|`│   └── default.rb`|			The default `role`|
|`├── site-cookbooks`|			A place to store our cookbooks|
|`│   └── base`|				A "base" `cookbook` which will be used in the solo part of the workshop|
|`└── solo.rb`|					The `chef-solo` configutaion file|



###chef solo route:

Create any node you want :) you can use the .centos_node / .ubuntu_node provided with this repo:\

	cd ubuntu_node
	vagrant up

connect to the node

	vagrant ssh

become root

	sudo -i

git checkout this repository ::

	git clone https://github.com/tikalk-cookbooks/chef_workshop.git
	cd chef_workshop
	librarian-chef install && chef-solo -c solo.rb	

Considering the fact solo.rb sets the default json file see solo.rb:
	
	# Default json
	json_attribs File.join(base_dir, 'nodes', 'default.json')
