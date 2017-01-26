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

    it 'includes the openssh recipe' do
      expect(chef_run).to include_recipe('openssh')
    end

    it 'renders /etc/ssh/sshd_config' do
      expect(chef_run).to render_file('/etc/ssh/sshd_config').with_content { |content|
        expect(content).to include('ChallengeResponseAuthentication no')
        expect(content).to include('Ciphers aes256-ctr,aes192-ctr,aes128-ctr')
        expect(content).to include('GssapiAuthentication yes')
        expect(content).to include('KexAlgorithms diffie-hellman-group-exchange-sha256')
        expect(content).to include('LogLevel INFO')
        expect(content).to include('MACs hmac-sha2-512,hmac-sha2-256')
        expect(content).to include('PasswordAuthentication no')
        expect(content).to include('PermitRootLogin no')
        expect(content).to include('Protocol 2')
        expect(content).to include('SyslogFacility AUTHPRIV')
        expect(content).to include('UsePAM yes')
        expect(content).to include('X11Forwarding no')
        expect(content).to include('MaxAuthTries 4')
        expect(content).to include('IgnoreRhosts yes')
        expect(content).to include('HostbasedAuthentication no')
        expect(content).to include('PermitEmptyPasswords no')
        expect(content).to include('PermitUserEnvironment no')
        expect(content).to include('ClientAliveInterval 300')
        expect(content).to include('ClientAliveCountMax 0')
        expect(content).to include('AllowUsers vagrant')
        expect(content).to include('Banner /etc/issue')
      }
    end

    it 'renders /etc/securetty' do
      expect(chef_run).to render_file('/etc/securetty').with_content(/\Atty1\ntty2\ntty3\ntty4\ntty5\ntty6\ntty7\ntty8\ntty9\ntty10\ntty11\nttyS0\Z/)
    end

    it 'renders /etc/pam.d/su' do
      expect(chef_run).to render_file('/etc/pam.d/su').with_content(/^auth\s+required\s+pam_wheel.so\s+use_uid$/)
    end

    it 'includes the rhel recipe' do
      expect(chef_run).to include_recipe('base_hardening::rhel')
    end

    it 'includes the issue_file recipe' do
      expect(chef_run).to include_recipe('base_hardening::issue_file')
    end
    
  end
end
