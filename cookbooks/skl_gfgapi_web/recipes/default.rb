#
# Cookbook Name:: skl_gfgapi_web
# Recipe:: default
#
# Copyright 2012, SKILLABS
#
# All rights reserved - Do Not Redistribute
#

group "gfgapi-group" do
  gid 2000
end

user "gfgapi-user" do
  uid 2000
  gid 2000
  home "/srv/gfgapi"
  shell "/bin/false"
end

node['skl_gfgapi_web']['env'].each do |api_env|
  application "gfgapi" do
    path "/srv/gfgapi/#{api_env}"
    owner "gfgapi-user"
    group "gfgapi-group"

    repository "https://github.com/scheuk/test-rails-api.git"
    revision api_env == "dev" ? "master" : api_env

    rails do
      # Rails-specific configuration
      bundle_command "/usr/local/bin/bundle"
    end

    passenger_apache2 do
      # Passenger-specific configuration
      server_name "#{api_env}.api.skillabs.com"
      #server_aliases ["dev.api.skillabs.com"]
      rails_env api_env
    end
  end
end