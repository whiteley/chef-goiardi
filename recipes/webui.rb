#
# Cookbook Name:: goiardi
# Recipe:: webui
#
# Copyright (C) 2015 Matt Whiteley
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'securerandom'
include_recipe 'nginx'
include_recipe 'rbenv'
include_recipe 'rbenv::ruby_build'

rbenv_ruby node['goiardi']['webui']['ruby_version']
node['goiardi']['webui']['rubies'].each do |r|
  rbenv_ruby r
end
rbenv_gem 'bundler' do
  ruby_version node['goiardi']['webui']['ruby_version']
end

directory "#{node['goiardi']['webui']['deploy_location']}/shared" do
  owner node['goiardi']['user']
  group node['goiardi']['group']
  mode "0775"
  action :create
  recursive true
end

%w(config log pids sockets system).each do |d|
  directory "#{node['goiardi']['webui']['deploy_location']}/shared/#{d}" do
    owner node['goiardi']['user']
    group node['goiardi']['group']
    mode "0775"
    action :create
  end
end

template "#{node['goiardi']['webui']['deploy_location']}/shared/config/puma.rb" do
  source "config-puma.rb.erb"
  owner node['goiardi']['user']
  group node['goiardi']['group']
  mode "0644"
  action :create
end

secret_token = SecureRandom.hex(30)
template "#{node['goiardi']['webui']['deploy_location']}/shared/config/secret_token.rb" do
  source "secret_token.rb.erb"
  owner node['goiardi']['user']
  group node['goiardi']['group']
  mode "0600"
  variables :token => secret_token
  action :create_if_missing
end

template "#{node['goiardi']['webui']['deploy_location']}/shared/config/webui_server_init.rb" do
  source "webui_server_init.rb.erb"
  owner node['goiardi']['user']
  group node['goiardi']['group']
  mode "0644"
  variables({
    :chef_server_url => node['goiardi']['webui']['chef_server_url'],
    :client_name => node['goiardi']['webui']['client_name'],
    :client_key => node['goiardi']['webui']['client_key'],
    :admin_user => node['goiardi']['webui']['admin_user'],
    :admin_pass => node['goiardi']['webui']['admin_password'],
    :http_headers => node['goiardi']['webui']['custom_http_headers'],
    :title_string => node['goiardi']['webui']['title_string']
  })
  action :create
end

deploy_revision node['goiardi']['webui']['deploy_location'] do
  repo node['goiardi']['webui']['repo_url']
  revision node['goiardi']['webui']['deploy_revision']
  user node['goiardi']['user']
  group node['goiardi']['group']
  action node['goiardi']['webui']['deploy_action'].to_sym
  symlink_before_migrate "config/puma.rb" => "config/puma.rb"
  migrate false
  before_restart do
    rbenv_execute "set-ruby-ver-chef-webui" do
      cwd release_path
      command "rbenv local #{node['goiardi']['webui']['ruby_version']}"
      user node['goiardi']['user']
      group node['goiardi']['group']
      action :run
    end
    rbenv_execute "bundle-chef-webui" do
      cwd release_path
      command "RAILS_ENV=#{node['goiardi']['webui']['environment']} bundle install --deployment --path vendor/bundle"
      user node['goiardi']['user']
      group node['goiardi']['group']
      ruby_version node['goiardi']['webui']['ruby_version']
      action :run
    end
    rbenv_execute "assets-chef-webui" do
      cwd release_path
      command "RAILS_ENV=#{node['goiardi']['webui']['environment']} bundle exec rake assets:precompile"
      user node['goiardi']['user']
      group node['goiardi']['group']
      ruby_version node['goiardi']['webui']['ruby_version']
      action :run
    end
  end
end

%w(secret_token webui_server_init).each do |f|
  file "#{node['goiardi']['webui']['deploy_location']}/current/config/initializers/#{f}.rb" do
    action :delete
  end
  link "#{node['goiardi']['webui']['deploy_location']}/current/config/initializers/#{f}.rb" do
    to "#{node['goiardi']['webui']['deploy_location']}/shared/config/#{f}.rb"
    action :create
  end
end

logrotate_app "webui" do
  cookbook "logrotate"
  path "#{node['goiardi']['webui']['deploy_location']}/shared/log/*.log"
  frequency "daily"
  rotate 14
  create "644 goiardi goiardi"
  enable true
end

# create service. Upstart only, atm.
case node["platform"]
when "ubuntu"
  cookbook_file "/etc/init/puma-manager.conf" do
    source "puma-manager.conf"
    owner "root"
    group "root"
    mode "0644"
    action :create
  end
  template "/etc/init/puma.conf" do
    source "puma-upstart.conf.erb"
    owner "root"
    group "root"
    mode "0644"
    action :create
  end
  file "/etc/puma.conf" do
    owner "root"
    group "root"
    mode "0644"
    content "#{node['goiardi']['webui']['deploy_location']}/current"
    action :create
  end
end

service "puma-manager" do
  case node["platform"]
  when "ubuntu"
    if node["platform_version"].to_f >= 9.10
      provider Chef::Provider::Service::Upstart
    end
  end
  action [ :enable, :start ]
end

# nginx on first boot
execute "nginx-stop-and-kill" do
  creates "/etc/nginx/firstboot"
  command "touch /etc/nginx/firstboot && service nginx stop && killall -9 nginx || echo 'not killed'"
  ignore_failure true
  notifies :start, "service[nginx]", :immediately
end

if node['goiardi']['use_ssl']
  file node['goiardi']['ssl_cert_filename'] do
    mode '0444'
    owner node['goiardi']['user']
    group node['nginx']['group']
    action :touch
  end
  file node['goiardi']['ssl_key_filename'] do
    mode '0440'
    owner node['goiardi']['user']
    group node['nginx']['group']
    action :touch
  end
end

template "/etc/nginx/sites-available/goiardi-webui" do
  source "goiardi_nginx.conf.erb"
end

nginx_site 'default' do
  enable false
end

nginx_site "goiardi-webui" do
  notifies :restart, 'service[nginx]'
end
