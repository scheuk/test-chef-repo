# A Base role that every skillabs server should have

name "base"
description "Base Packages that all SkilLabs server should have"

run_list "recipe[apt]", "recipe[ntp]", "recipe[logrotate]", "recipe[openssh]", "recipe[chef-client::config]", "recipe[chef-client::service]"


