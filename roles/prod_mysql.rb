name "prod_mysql"
description "Production Mysql Server"

run_list "recipe[mysql::server]"

default_attributes(
    "mysql" => {
        "server_root_password" => "pw4skillabs"
    }
)