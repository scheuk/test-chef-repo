#
# Cookbook Name:: skl_web
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

group "gfg-group" do
  gid 2001
end

user "gfg-user" do
  uid 2001
  gid 2001
  home "/srv/gfg"
  shell "/bin/false"
end

node['skl_web']['env'].each do |api_env|
  directory "/srv/gfg/#{api_env}" do
    recursive true
    action :create
    owner "gfg-user"
    group "gfg-group"
  end
  web_app "#{api_env}-gfg" do
    server_name "#{api_env}.skillabs.com"
    docroot "/srv/gfg/#{api_env}"
    template "gfg.conf.erb"
  end
end