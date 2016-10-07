#
# Cookbook Name:: motd-tail
# Provider:: motd_tail
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

class Chef::Provider::MotdTail < Chef::Provider::LWRPBase
  use_inline_resources

  def whyrun_supported?
    true
  end

  action :create do
    template new_resource.path do
      if new_resource.template_source.nil?
        source 'motd.tail.erb'
        cookbook 'motd-tail'
      else
        source new_resource.template_source
      end
      owner 'root'
      group 'root'
      mode '0644'
      backup 0
      action :create
    end
  end

  action :delete do
    file new_resource.path do
      action :delete
    end
  end
end
