name              "motd-tail"
maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Updates motd.tail with Chef Roles"
long_description  <<-EOH
Queries Chef for the roles assigned to the node and updates motd.tail
EOH
version           "1.1.0"
recipe            "motd-tail", "Updates motd.tail with useful node data"
