#
# Cookbook Name:: goiardi
# Recipe:: default
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

remote_file '/usr/bin/goiardi' do
  source node['goiardi']['bin']
  mode '0755'
end

directory node['goiardi']['confdir'] do
  mode '0755'
  owner 'root'
  group 'root'
  recursive true
end

%w( lfsdir rundir ).each do |d|
  directory node['goiardi'][d] do
    mode '0700'
    owner 'root'
    group 'root'
    recursive true
  end
end

template node['goiardi']['config'] do
  source 'goiardi.conf.erb'
  mode '0444'
  owner 'root'
  group 'root'
  variables(
    ipaddress: node['goiardi']['ipaddress'],
    port: node['goiardi']['port'],
    hostname: node['goiardi']['hostname'],
    rundir: node['goiardi']['rundir'],
    freeze_interval: node['goiardi']['freeze_interval'],
    obj_max_size: node['goiardi']['obj_max_size'],
    json_req_max_size: node['goiardi']['json_req_max_size'],
    log_file: node['goiardi']['log_file'],
    syslog: node['goiardi']['syslog'],
    log_level: node['goiardi']['log_level']
  )
end
