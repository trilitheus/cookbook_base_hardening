require 'spec_helper'

describe 'base_hardening::kernel_parameters' do
  context 'When all attributes are default on RHEL family docker container' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.node.automatic['os'] = 'linux'
      runner.node.automatic['platform_family'] = 'rhel'
      runner.node.automatic['platform'] = 'centos'
      runner.node.automatic['platform_version'] = '7'
      runner.node.automatic['virtualization']['system'] = 'docker'
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    %w(net.ipv4.conf.all.send_redirects
       net.ipv4.conf.default.send_redirects
       net.ipv4.conf.all.accept_redirects
       net.ipv4.conf.default.accept_redirects
       net.ipv4.conf.all.secure_redirects
       net.ipv4.conf.default.secure_redirects).each do |sysctl_0|
      it "sets #{sysctl_0}" do
        expect(chef_run).to apply_sysctl_param(sysctl_0).with_value('0')
      end
    end

    %w(net.ipv4.conf.all.log_martians
       net.ipv4.conf.default.log_martians
       net.ipv6.conf.all.disable_ipv6).each do |sysctl_1|
      it "sets #{sysctl_1}" do
        expect(chef_run).to apply_sysctl_param(sysctl_1).with_value('1')
      end
    end

    # it 'sets net.ipv4.tcp_syncookies to 1' do
    #   expect(chef_run).to apply_sysctl_param('net.ipv4.tcp_syncookies').with_value('1')
    # end
  end
end
