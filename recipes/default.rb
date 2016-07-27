#
# Cookbook Name:: base_hardening
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
case node['os']
when 'linux'
  include_recipe 'openssh::default'
  include_recipe 'base_hardening::cron'
  include_recipe 'base_hardening::kernel_parameters'
  template '/etc/securetty' do
    user 'root'
    group 'root'
    mode '00600'
  end
  case node['platform_family']
  when 'rhel'
    include_recipe 'base_hardening::rhel'
  end
end
