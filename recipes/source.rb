#
# Cookbook Name:: goiardi
# Recipe:: source
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

include_recipe "golang"

golang_package "goiardi" do
  action :install
end

goiardi_bin = "#{node["go"]["gobin"]}/goiardi"

link "/usr/bin/goiardi" do
  action :delete
end

link "/usr/bin/goiardi" do
  to goiardi_bin
  action :create
end
