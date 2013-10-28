
# System params - user, groups, direcotries etc 
default[:tikal][:grp_name] = 'tikal'
default[:tikal][:gid] = 10000
default[:tikal][:user_name] = 'tikal'
default[:tikal][:uid] = 10000
default[:tikal][:passwd] = 'tikal'
default[:tikal][:homedir] = '/home/' + node[:tikal][:user_name]
default[:tikal]
default[:tikal][:runtime_basedir] = '/opt' + node[:tikal][:user_name]
