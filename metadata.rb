name 'base_hardening'
maintainer 'Alliantist Ltd'
maintainer_email 'sysadmins@pam-it.com'
license 'all_rights'
description 'Configures various elements of a server in accordance with CIS recommendations'
long_description 'Configures various elements of a server in accordance with CIS recommendations'
version '0.3.2'

supports 'redhat', '= 7'
supports 'centos', '= 7'

depends 'openssh', '~> 2.0.0'
depends 'sysctl', '~> 0.8.0'
