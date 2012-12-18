#
# Cookbook Name:: skl_gfgapi_web
# Recipe:: default
#
# Copyright 2012, SKILLABS
#
# All rights reserved - Do Not Redistribute
#

ohai "reload" do
  action :reload
end

# install packages for nokogiri gem
%w{libxslt-dev libxml2-dev}.each do |pkg|
  package pkg
end

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
  node.set['skl_gfgapi_web']['server_name'] = "#{api_env}.api.skillabs.com"
  application "#{api_env}-gfgapi" do
    path "/srv/gfgapi/#{api_env}"
    owner "gfgapi-user"
    group "gfgapi-group"
    environment_name api_env

    repository "https://github.com/scheuk/test-rails-api.git"
    revision api_env == "dev" ? "master" : api_env

    rails do
      # Rails-specific configuration
      bundler true
      bundle_command "/usr/local/bin/bundle"
      #server_name "#{api_env}.api.skillabs.com"
    end

    passenger_apache2 do
      # Passenger-specific configuration
      #server_aliases ["dev.api.skillabs.com"]
    end
  end
end