#
# Cookbook Name:: goiardi
# Attributes:: default
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

default['goiardi']['version'] = '0.9.2'
default['goiardi']['os'] = node['os'].downcase
default['goiardi']['arch'] = 'amd64'
default['goiardi']['bin'] = "https://github.com/ctdk/goiardi/releases/download/v#{node['goiardi']['version']}/goiardi-#{node['goiardi']['version']}-#{node['goiardi']['os']}-#{node['goiardi']['arch']}"
default['goiardi']['confdir'] = '/etc/goiardi'
default['goiardi']['config'] = "#{node['goiardi']['confdir']}/goiardi.conf"
default['goiardi']['rundir'] = '/var/run/goiardi'
default['goiardi']['lfsdir'] = "#{node['goiardi']['rundir']}/file_checksums"
default['goiardi']['ipaddress'] = '0.0.0.0'
default['goiardi']['port'] = '4545'
default['goiardi']['hostname'] = node['hostname']
default['goiardi']['freeze_interval'] = '10'
default['goiardi']['obj_max_size'] = '10485760'
default['goiardi']['json_req_max_size'] = '1000000'
default['goiardi']['log_file'] = nil
default['goiardi']['syslog'] = true
default['goiardi']['log_level'] = 'critical'
default['goiardi']['use_auth'] = true

default['goiardi']['use_ssl'] = false
default['goiardi']['ssl_cert'] = nil
default['goiardi']['ssl_key'] = nil
default['goiardi']['ssl_cert_filename'] = "#{node['goiardi']['confdir']}/cert.pem"
default['goiardi']['ssl_key_filename'] = "#{node['goiardi']['confdir']}/key.pem"
default['goiardi']['https_urls'] = false

default['goiardi']['use_mysql'] = false
default['goiardi']['mysql_username'] = 'root'
default['goiardi']['mysql_password'] = 'root'
default['goiardi']['mysql_protocol'] = 'tcp'
default['goiardi']['mysql_address'] = 'localhost'
default['goiardi']['mysql_port'] = '3306'
default['goiardi']['mysql_dbname'] = 'goiardi'

default['goiardi']['use_postgresql'] = false
default['goiardi']['postgresql_username'] = 'root'
default['goiardi']['postgresql_password'] = 'root'
default['goiardi']['postgresql_host'] = 'localhost'
default['goiardi']['postgresql_port'] = '5432'
default['goiardi']['postgresql_dbname'] = 'goiardi'
default['goiardi']['postgresql_sslmode'] = 'disable'
