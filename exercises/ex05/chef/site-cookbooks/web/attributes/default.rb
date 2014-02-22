# Just for demonstration puposes listen on port 4000

default['nginx']['port'] = '4000'
default['nginx']['listen_ports']      = %w[80, #{node['nginx']['port']}]
default['nginx']['vhost']['basedir'] = '/var/www/nginx'
default['nginx']['vhost']['demo'] = "#{node['nginx']['vhost']['basedir']}/demo"
