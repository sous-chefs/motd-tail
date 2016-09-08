# motd-tail Cookbook

[![Build Status](https://travis-ci.org/chef-cookbooks/motd-tail.svg?branch=master)](http://travis-ci.org/chef-cookbooks/motd-tail) [![Cookbook Version](https://img.shields.io/cookbook/v/motd-tail.svg)](https://supermarket.chef.io/cookbooks/motd-tail)

Updates motd.tail with Chef Roles

## Requirements

### Platforms

- Debian/Ubuntu

### Chef

- Chef 12+

### Cookbooks

- None

## Attributes

- `node['motd-tail']['additional_text']` - Additional text to add to the end of the motd.tail (e.g. unauthorized access banner).

## Usage

```json
"run_list": [
    "recipe[motd-tail]"
]
```

### default

Updates motd.tail with useful node data

### Examples

For example,

```
% ssh myserver.int.example.org
***
Chef-Client - myserver.int.example.org
ubuntu
samba_server
netatalk_server
munin_server
rsyslog_server
***

Additional text here when `node['motd-tail']['additional_text']` present.
```

## License & Authors

**Author:** Cookbook Engineering Team ([cookbooks@chef.io](mailto:cookbooks@chef.io))

**Copyright:** 2009-2016, Chef Software, Inc.

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
