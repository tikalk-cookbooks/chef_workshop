# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
BASE_DIR = File.dirname(__FILE__)
NAME = "chef-solo-demo"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "CentOS 6.4 x86_64"
  config.vm.box_url = "http://shonky.info/centos64.box"
  config.vm.network "private_network", ip: "192.168.56.80"
  #config.vm.network "public_network"
  config.vm.hostname = "#{NAME}"
  #config.vm.network "forwarded_port", guest: 4000, host: 4000
  #config.vm.network :forwarded_port, host: 4567, guest: 4000
  #config.vm.network :forwarded_port, host: 4000, guest: 4567
  #config.vm.network "forwarded_port", guest: 80, host: 8080


  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    # vb.gui = true
    vb.customize [ "modifyvm", :id, "--memory", "512"]
    vb.name = "#{NAME}"
  end

  #config.vm.provision :shell, :path => File.expand_path("install-chef-client.sh", __FILE__)
  config.vm.provision "shell",
    inline: "[[ `which chef-solo` ]] || curl -L https://www.opscode.com/chef/install.sh | sudo bash"
  config.vm.provision :chef_solo do |chef|
          # Proxy support for chef-solo, else i.e. remote_file externally will do worklibr
          #chef.http_proxy    = ""
          #chef.https_proxy    = ""
          #chef.no_proxy       = ""

          chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
          chef.roles_path     = ["roles"]
          chef.log_level      = ENV['CHEF_LOG'] ? ENV['CHEF_LOG'].to_sym : :info
          #chef.log_level      = ENV['CHEF_LOG'] ? ENV['CHEF_LOG'].to_sym : :debug
          chef.add_role "web"
          # You may also specify custom JSON attributes:
  end

end
