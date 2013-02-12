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

template_file = "gfg.conf.erb"

if node['skl_web']['env'].include?("dev")
  template_file = "dev-gfg.conf.erb"
  directory "/srv/git_temp/gfgflash" do
    recursive true
    action :create
    owner "gfg-user"
    group "gfg-group"
  end

  cookbook_file "/srv/git_temp/ssh-wrapper.sh" do
    source "ssh-wrapper.sh"
    mode 0755
  end

  cookbook_file "/srv/git_temp/ssh_git_deploy.pem" do
    source "ssh_git_deploy.pem"
    mode 0600
  end

  include_recipe "git"

  git "/srv/git_temp/gfgflash" do
    repository "git@github.com:SKILLabs/gfg_flash.git"
    action :sync
    reference "master"
    ssh_wrapper "/srv/git_temp/ssh-wrapper.sh"
  end

  execute "rsync dist to dev" do
    command "rsync -a --delete /srv/git_temp/gfgflash/dist/ /srv/gfg/dev"
  end

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
    template template_file
  end
end
