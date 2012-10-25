name "prod_gfgapi_web"
description "Production GFGAPI Server"

run_list "recipie[git],recipe[skl_gfgapi_web]"

default_attributes(
)