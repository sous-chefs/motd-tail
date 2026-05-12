# frozen_string_literal: true

name              'motd-tail'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Provides the motd_tail resource for managing Ubuntu MOTD tail content'
version           '7.0.0'
source_url        'https://github.com/sous-chefs/motd-tail'
issues_url        'https://github.com/sous-chefs/motd-tail/issues'
chef_version      '>= 15.3'

supports 'ubuntu', '>= 22.04'
