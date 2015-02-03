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

default[:goiardi][:version] = "0.9.0"
default[:goiardi][:os]      = node[:os].downcase
default[:goiardi][:arch]    = "amd64"
default[:goiardi][:bin]     = "https://github.com/ctdk/goiardi/releases/download/v#{node[:goiardi][:version]}/goiardi-#{node[:goiardi][:version]}-#{node[:goiardi][:os]}-#{node[:goiardi][:arch]}"
default[:goiardi][:config]  = "/etc/goiardi.conf"
default[:goiardi][:rundir]  = "/var/run/goiardi"
