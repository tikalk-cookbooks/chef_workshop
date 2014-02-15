# SEE: http://wiki.opscode.com/display/chef/Troubleshooting+and+Technical+FAQ
# set some sensible defaults

base_dir = File.dirname(__FILE__)
user          = ENV['LIGHTAPP_USER'] || ENV['USER']

log_level                :debug
log_location             STDOUT
node_name                `hostname`
client_key               "#{user}.pem"
validation_client_name   ''
validation_key           "#{base_dir}/validation.pem"
chef_server_url          ''
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
require 'librarian/chef/integration/knife'
cookbook_path [File.join(base_dir, '/../site-cookbooks'), Librarian::Chef.install_path]
# Using librarian-chef will use deps from chef cache dir !!!! not ./cookbooks as default !!! 
# see: https://github.com/applicationsonline/librarian-chef
# Without librarian-chef user this ...
# cookbook_path [File.join(base_dir, '/../site-cookbooks'), File.join(base_dir, '/../cookbooks')]
cookbook_copyright       'Tikal Knowledge LTD'
cookbook_license         'apachev2'
cookbook_email           "#{user}@tikalk.com"

environment_path File.join(base_dir, '/../environment')
role_path File.join(base_dir, '/../roles')
data_bag_path File.join(base_dir, '/../data_bags')
