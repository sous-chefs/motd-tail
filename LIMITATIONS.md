# Limitations

## Package Availability

### APT (Ubuntu)

This cookbook manages Ubuntu MOTD tail content and the `/etc/update-motd.d`
integration script. Ubuntu currently publishes supported LTS releases including
22.04 and 24.04, and Launchpad publishes the `update-motd` source package for
24.04 and 26.04.

## Architecture Limitations

The cookbook writes text files and installs the Ubuntu `update-motd` package.
No architecture-specific binaries are managed by the cookbook.

## Source/Compiled Installation

No source build path is required.

## Known Issues

Ubuntu 18.04 and 20.04 are in Extended Security Maintenance rather than standard
support, so they are not included in the active test matrix.
