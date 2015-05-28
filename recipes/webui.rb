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

include_recipe 'nginx'
include_recipe 'rbenv'
include_recipe 'rbenv::ruby_build'

rbenv_ruby node['goiardi']['webui']['ruby_version']
rbenv_gem 'bundler' do
  ruby_version node['goiardi']['webui']['ruby_version']
end

deploy_revision node['goiardi']['webui']['deploy_location'] do
  repo node['goiardi']['webui']['repo_url']
  revision node['goiardi']['webui']['deploy_revision']
  action node['goiardi']['webui']['deploy_revision'].to_sym
  migrate false
end
