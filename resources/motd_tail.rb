#
# Cookbook:: motd-tail
# Provider:: motd_tail
#
# Author:: Sean OMeara <someara@sean.io>
# Author:: Tim Smith <tsmith@chef.io>
# Copyright:: 2013-2019, Chef Software Inc.
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

provides :motd_tail

property :path, String, name_property: true
property :template_source, String
property :template_cookbook, String

action :create do
  new_resource.template_source   ||= 'motd.tail.erb'
  new_resource.template_cookbook ||= 'motd-tail'

  template new_resource.path do
    source new_resource.template_source
    cookbook new_resource.template_cookbook
    mode '0644'
    owner 'root'
    group 'root'
    backup 0
    action :create
  end

  if node['platform_version'].to_f > 12.04
    package 'update-motd'

    template '/etc/update-motd.d/99-chef-info' do
      source '99-chef_info.erb'
      cookbook 'motd-tail'
      mode '0755'
      variables(path: new_resource.path)
    end
  end
end

action :delete do
  file new_resource.path do
    action :delete
  end
end
