#
# Cookbook Name:: web
# Recipe:: default
#
# Copyright 2013, Tikal Knowledge LTD
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "nginx"

#Crete the runtime directory - using directory resource [ chef core resource provider ]
directory node[:nginx][:vhost][:demo] do
  owner 'nginx'
  group 'nginx'
  recursive true
end


template "/etc/nginx/sites-available/demo-site" do  # the "default" sites-available dir under nginx's run folder
  source "demo-site.erb"			    # the template file to use
  owner "root"					    # Owner of the file
  group "root"					    # Group of the file
  mode 0644 					    # Mode
  notifies :restart, "service[nginx]"		    # Restart nginx upon configuration
end

# Create a website from template ...
template "#{node[:nginx][:vhost][:demo]}/index.html" do #index file location 
  source "index.html.erb"					  # now user 
  owner  "nginx"						  # is nginx [ the user running the nginx server !]
  group  "nginx"
end

nginx_site "demo-site" do			    # "nginx_ensite" see :: https://github.com/perusio/nginx_ensite
  enable :true
  notifies :restart, "service[nginx]"
end

# disable iptables !
include_recipe "iptables::disabled"
#iptables_rule 'nginx_ports'



