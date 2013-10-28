# make sure we have all the repos we need on our system ...
include_recipe "yum::yum"
include_recipe "yum::epel"
include_recipe "yum::ius"
include_recipe "yum::repoforge"
include_recipe "yum::remi"


