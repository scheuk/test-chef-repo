name "dev_gfg_web"
description "Dev/QA GFG Web Server"

run_list "recipe[skl_web]"

default_attributes(
    "skl_web" => {
        "env" => ["dev", "qa"]
    }
)
