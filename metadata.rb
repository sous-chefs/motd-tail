name             'motd-tail'
maintainer       'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license          'Apache 2.0'
description      'Updates motd.tail with Chef Roles'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.3'

recipe           'motd-tail', 'Updates motd.tail with useful node data'

%w(debian ubuntu).each do |os|
  supports os
end

source_url 'https://github.com/opscode-cookbooks/motd-tail' if respond_to?(:source_url)
issues_url 'https://github.com/opscode-cookbooks/motd-tail/issues' if respond_to?(:source_url)

