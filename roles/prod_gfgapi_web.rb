name "prod_gfgapi_web"
description "Production GFGAPI Server"

run_list "recipe[skl_gfgapi_web]"

default_attributes(
)