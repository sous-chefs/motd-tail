# motd-tail CHANGELOG

This file is used to list changes made in each version of the motd-tail cookbook.

## Unreleased

## 6.0.10 - *2024-05-03*

## 6.0.9 - *2023-12-27*

## 6.0.8 - *2023-10-31*

## 6.0.7 - *2023-09-29*

## 6.0.6 - *2023-09-28*

## 6.0.5 - *2023-07-10*

## 6.0.4 - *2023-05-17*

## 6.0.3 - *2023-05-03*

## 6.0.2 - *2023-04-01*

## 6.0.1 - *2023-03-03*

## 6.0.0 - *2022-02-23*

- resolved cookstyle error: resources/motd_tail.rb:1:1 refactor: `Chef/Deprecations/ResourceWithoutUnifiedTrue`
- Require Chef 15.3+ for unified_mode support
- Enable unified_mode for Chef 17+ support

## 5.2.3 - *2022-02-08*

- Remove delivery folder

## 5.2.2 - *2021-08-31*

- Standardise files with files in sous-chefs/repo-management

## 5.2.1 - *2021-06-01*

- Standardise files with files in sous-chefs/repo-management

## 5.2.0 - *2021-02-26*

- Sous Chefs Adoption
- Cookstyle fixes

## 5.1.0 (2017-08-09)

- Added template cookbook property, updated readme and spec tests

## 5.0.2 (2017-07-14)

- changed name of update-motd.d script, script is not run with underscore in name on canonical 14.04 and 16.04 default images

## 5.0.1 (2017-04-26)

- Update apache2 license string

## 5.0.0 (2017-02-27)

- Require Chef 12.5+ and remove compat_resource dep

## 4.1.0 (2017-01-18)

- Update chef requirement in the readme
- Show policy group/name when using policyfiles
- Fix deprecation warning
- Remove superfluous converge_by
- Convert to a custom resource
- Support Ubuntu 14.04+

## 4.0.1 (2016-09-08)

- Fix specs and matcher

## 4.0.0 (2016-09-07)

- Resolve rubocop warning
- Testing updates
- Require Chef 12+

## v3.0.0 (2015-10-20)

- Updated .gitignore file
- Removed Cheffile
- Updated Test Kitchen for the new format and modern Linux distros
- Added Chef standard Rubocop config
- Added testing in Travis CI
- Added a Berksfile
- Updated contributing and testing docs
- Added maintainers.md and maintainers.toml files
- Added Travis and cookbook version badges to the readme
- Removed Chef 10 backwards compatibility
- Expanded the requirements section in the readme and clarify the minimum supported Chef release is 11
- Updated Opscode -> Chef Software
- Added a Rakefile for simplified testing
- Added a Chefignore file
- Resolved Rubocop warnings
- Added long_description to the metadata
- Added source_url and issues_url to the metadata
- Added basic Chefspec convergence test

## v2.0.2 (2014-04-09)

- #7 - Fix wrong cookbook name in template source parameter

## v2.0.0 (2014-03-18)

- Refactored into a library cookbook to allow template replacement

## v1.2.2 (2014-03-18)

- [COOK-4434] - remove timestamp from template to prevent a change every Chef run

## v1.2.0

- [COOK-2089] - Add the ability to add additional text to motd

## v1.1.0

- [COOK-1387] - additional data for MOTD

## v1.0.0

- Initial public release.
