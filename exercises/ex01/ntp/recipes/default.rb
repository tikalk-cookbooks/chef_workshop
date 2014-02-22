#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2013, Tikal Knowledge
#
# Apache 2.0 license
#


package "ntp" do                                # like doing yum install ntp / apt-get install ntp
    action [:install]
end

template "/etc/ntp.conf" do                     # use a template to define /etc/ntp.conf
    source "ntp.conf.erb"
    variables( :ntp_server => "time.nist.gov" )
    notifies :restart, "service[ntpd]"
end

service "ntpd" do                               # start the service
    action [:enable,:start]
end

