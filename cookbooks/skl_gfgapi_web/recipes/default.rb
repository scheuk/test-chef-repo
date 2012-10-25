#
# Cookbook Name:: skl_gfgapi_web
# Recipe:: default
#
# Copyright 2012, SKILLABS
#
# All rights reserved - Do Not Redistribute
#

application "gfgapi" do
  path "/srv/gfgapi"
  owner "gfgapi-user"
  group "gfgapi-group"

  repository "https://github.com/scheuk/test-rails-api.git"
  revision "master"

  rails do
    # Rails-specific configuration
  end

  passenger_apache2 do
    # Passenger-specific configuration
  end
end