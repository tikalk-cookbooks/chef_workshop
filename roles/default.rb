name "default"
description "The basic stuff any server needs - rpm repos, users, etc etc ..."
run_list "recipe[yum::yum]", "recipe[base]"

override_attributes({
   :yum => { 
	:repoforge_release => '0.5.3-1' 
   }
})
