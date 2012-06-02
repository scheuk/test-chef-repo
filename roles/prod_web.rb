# A basic web role for a skillabs web server

name "prod_web"
description "Production Web Server"

run_list "recipe[apache2]", "recipe[apache2::mod_php5]", "recipe[build-essential]", "recipe[php]", "recipe[skl_web::php_mod_mongo]"

default_attributes(
    "apache2" => {
        "listen_ports" => ["80"]
    }
)