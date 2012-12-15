name "dev_gfgapi_web"
description "Dev/QA GFGAPI Server"

run_list "recipe[ruby]","recipe[bundler]","recipe[git]","recipe[skl_gfgapi_web]"

default_attributes(
    "languages" => {
        "ruby" => {
            "default_version" => "1.9.1"
        }
    },
   "skl_gfgapi_web" => {
      env => ["dev"]
    }
)
