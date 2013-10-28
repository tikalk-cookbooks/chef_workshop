attrs = node[:tikal]

# create sapinst group
group attrs[:grp_name] do
  gid attrs[:gid]
  # members [root]
end

user attrs[:user_name] do
  supports :manage_home => true
  comment "Tikal Operations User"
  uid attrs[:uid]
  gid attrs[:gid]
  home attrs[:homedir]
  shell "/bin/bash"
  password attrs[:passwd] # will replace with encrypted one in teh future ...
end

# Create relevant directories
[ "#{attrs[:runtime_basedir]}" ].each do |create_dir|
  directory create_dir do
    owner attrs[:user_name]
    group attrs[:grp_name]
    mode 00755
    recursive true
    action :create
    not_if {File.exists?("#{create_dir}")}
  end
end
