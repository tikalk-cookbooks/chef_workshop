name "db"
description "database server [amongst other things, is up to you to decide ...]"
run_list "role[default]", "recipe[mysql::server]"

