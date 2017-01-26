#
# Cookbook Name:: base_hardening
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'base_hardening::default' do
  context 'When all attributes are default on RHEL family' do
    cached(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.node.automatic['virtualization']['system'] = 'docker'
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'renders /etc/securetty' do
      expect(chef_run).to render_file('/etc/securetty').with_content(/\Atty1\ntty2\ntty3\ntty4\ntty5\ntty6\ntty7\ntty8\ntty9\ntty10\ntty11\nttyS0\Z/)
    end

    it 'renders /etc/pam.d/su' do
      expect(chef_run).to render_file('/etc/pam.d/su').with_content(/^auth\s+required\s+pam_wheel.so\s+use_uid$/)
    end

    it 'includes the sshd_config recipe' do
      expect(chef_run).to include_recipe('base_hardening::sshd_config')
    end

    it 'includes the rhel recipe' do
      expect(chef_run).to include_recipe('base_hardening::rhel')
    end

    it 'includes the issue_file recipe' do
      expect(chef_run).to include_recipe('base_hardening::issue_file')
    end
  end
end
