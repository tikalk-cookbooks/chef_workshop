![Tikal](http://www.tikalk.com/files/upload/1/tikal_com_logo45n45.png "Tikal Community") Chef workshop
=============

## Quick start

###Prequisets 
I assume you have git

1. Install [virtualbox][virtualbox]
2. Install ruby (I recommend [rvm][rvm] & ruby gems
3. install bundler gem [gem install bundler](http://bundler.io/)
4. Install [Vagrant][vagrant]
5. ./boostrap.sh - this will install chef via omnibus, __please make sure__ this is what you want to use or do this manually !

###Choose your route
####Chef Server route see ./chef_server_route/README.md
####Chef Solo route see ./chef_solo_route/README.md


## What lies here ?:

| Directory | Purpose |
|:------------- |:------------- |
|`├── .chef`|					A chef configuration for the |chef-solo| part for the workshop|
|`│   └── knife.rb`|			Knife configuration file with some "sane" defaults|
|`├── .gitignore`|				A set of files / paths we don't on in source control |
|`├── Cheffile`|				The chef cookbooks / dependencies used in the chef-solo part of the workshop|
|`├── Gemfile`|					Chef is ruby and we need some gems to work it …|
|`├── README.md`|				This file|
|`├── bootstrap.sh`|			If you have nothing installed - this will get you started|
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
|`├── chef_solo_route`|			__A set of machines__ for the `chef-solo route`|
|`│   ├── centos_node`|			A centos node for this lab based on [CentOS 6.4 x86_64][CentOS 6.4 x86_64] some more stuff for chef-solo|
|`│   │   ├── Vagrantfile`|		A [vagrant][vagrant] file which instatiates this machine with VirtualBox provider|
|`│   │   └── bootstrap.sh`|	A Shell script which customizes this machine for the `chef solo` route of the workshop|
|`│   └── ubutnu_node`|			A ubutnu node ... based on [canonical-ubuntu-12.04][canonical-ubuntu-12.04]|
|`│       ├── Vagrantfile`|		A [vagrant][vagrant] file which instatiates this machine with VirtualBox provider|
|`│       └── bootstrap.sh`|	A Shell script which customizes this machine for the `chef solo` route of the workshop|
|`├── nodes`|					Chef node objects user in `chef solo` route |
|`│   ├── db.json`| 			A database node exmaple|
|`│   └── default.json`|		A default node - basically will run the default role see `roles` dir below|
|`├── roles`|					Chef `role` objects as files in `chef solo` route|
|`│   ├── db.rb`|				The datbase `role`|
|`│   └── default.rb`|			The default `role`|
|`├── site-cookbooks`|			A place to store our cookbooks|
|`│   └── base`|				A "base" `cookbook` which will be used in the solo part of the workshop|
|`└── solo.rb`|					The `chef-solo` configutaion file|


[canonical-ubuntu-12.04]: http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box
[CentOS 6.4 x86_64]: http://shonky.info/centos64.box
[vagrant]: http://downloads.vagrantup.com/  "Download Vagrant"
[knife]: http://docs.opscode.com/knife.html "Chef's knife"
[virtualbox]: https://www.virtualbox.org/wiki/Downloads "Virtual Box"
[rvm]: http://rvm.io/) "Ruby versio manager"
