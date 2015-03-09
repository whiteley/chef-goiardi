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

default['goiardi']['version']   = '0.9.0'
default['goiardi']['os']        = node['os'].downcase
default['goiardi']['arch']      = 'amd64'
default['goiardi']['bin']       = "https://github.com/ctdk/goiardi/releases/download/v#{node['goiardi']['version']}/goiardi-#{node['goiardi']['version']}-#{node['goiardi']['os']}-#{node['goiardi']['arch']}"
default['goiardi']['confdir']   = '/etc/goiardi'
default['goiardi']['config']    = "#{node['goiardi']['confdir']}/goiardi.conf"
default['goiardi']['rundir']    = '/var/run/goiardi'
default['goiardi']['lfsdir']    = "#{node['goiardi']['rundir']}/file_checksums"
default['goiardi']['ipaddress'] = '0.0.0.0'
default['goiardi']['port']      = '4545'
default['goiardi']['hostname']  = node['hostname']
default['goiardi']['freezeint'] = '10'
default['goiardi']['objsize']   = '10485760'
default['goiardi']['jsonsize']  = '1000000'
default['goiardi']['logfile']   = nil
default['goiardi']['syslog']    = true
default['goiardi']['loglevel']  = 'critical'
