#
# Cookbook Name:: motd-tail
# Resource:: motd_tail
#
# Author:: Sean OMeara <someara@chef.io>
# Copyright 2013-2015, Chef Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License""");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Chef::Resource::MotdTail < Chef::Resource::LWRPBase
  self.resource_name = 'motd_tail'

  actions :create, :delete
  default_action :create
  attribute :path, :kind_of => String, :name_attribute => true, :default => '/etc/motd.tail'
  attribute :template_source, :kind_of => String, :default => nil
end
