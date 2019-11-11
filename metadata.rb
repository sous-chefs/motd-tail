name 'motd-tail'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description 'Updates motd.tail with Chef Roles'
version '5.1.0'

%w(debian ubuntu).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/motd-tail'
issues_url 'https://github.com/chef-cookbooks/motd-tail/issues'
chef_version '>= 12.5' if respond_to?(:chef_version)
