# cis-net-4.1.2
default['base_hardening']['sysctl']['net.ipv4.conf.all.send_redirects'] = '0'
default['base_hardening']['sysctl']['net.ipv4.conf.default.send_redirects'] = '0'
# cis-net-4.2.2
default['base_hardening']['sysctl']['net.ipv4.conf.all.accept_redirects'] = '0'
default['base_hardening']['sysctl']['net.ipv4.conf.default.accept_redirects'] = '0'
# cis-net-4.2.3
default['base_hardening']['sysctl']['net.ipv4.conf.all.secure_redirects'] = '0'
default['base_hardening']['sysctl']['net.ipv4.conf.default.secure_redirects'] = '0'
# cis-net-4.2.4
default['base_hardening']['sysctl']['net.ipv4.conf.all.log_martians'] = '1'
default['base_hardening']['sysctl']['net.ipv4.conf.default.log_martians'] = '1'
# cis-net-4.2.8
default['base_hardening']['sysctl']['net.ipv4.tcp_syncookies'] = '1' unless node['virtualization']['system'] == 'docker'
# cis-net-4.4.2 - is not available in docker containers
default['base_hardening']['sysctl']['net.ipv6.conf.all.disable_ipv6'] = '1'
