base_dir = File.expand_path('../', __FILE__)
cookbook_path [File.join(base_dir, 'cookbooks'), File.join(base_dir, 'site-cookbooks')]
role_path File.join(base_dir, 'roles')
data_bag_path File.join(base_dir, 'data_bags')

file_cache_path file_cache_path File.join(base_dir, 'tmp')

#http_proxy ""
##https_proxy ""
##no_proxy "10.*, localhost, 127.0.0.1"
#
# Default json 
json_attribs File.join(base_dir, 'nodes', 'default.json')
