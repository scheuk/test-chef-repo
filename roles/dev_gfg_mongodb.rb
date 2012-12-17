name "dev_gfg_mongodb"
description "Dev/QA/stage MongoDB Server"

run_list "recipe[mongodb::10gen_repo]","skl_mongodb"

