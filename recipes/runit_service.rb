#
# Cookbook Name:: goiardi
# Recipe:: runit_service
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

include_recipe "goiardi"
include_recipe "runit"

runit_service "goiardi" do
  options(
    config: node["goiardi"]["config"],
    dirs: [ File.dirname(node["goiardi"]["index_file"]),
            File.dirname(node["goiardi"]["data_file"]),
            node["goiardi"]["lfsdir"]
    ].uniq
  )
  subscribes :restart, "template[#{node["goiardi"]["config"]}]"
end
