#
# Cookbook Name:: base_hardening
# Spec:: rhel
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'base_hardening::rhel' do
  context 'When all attributes are default on RHEL family' do
    cached(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.node.automatic['virtualization']['system'] = 'docker'
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'renders /etc/profile' do
      expect(chef_run).to render_file('/etc/profile').with_content(/umask\s+022/)
    end

    it 'renders /etc/pam.d/passwd' do
      expect(chef_run).to render_file('/etc/pam.d/passwd').with_content { |content|
        expect(content).to match(/auth\s+include\s+system-auth/)
        expect(content).to match(/account\s+include\s+system-auth/)
        expect(content).to match(/password\s+include\s+system-auth/)
        expect(content).to match(/-password\s+optional\s+pam_gnome_keyring.so\s+use_authtok/)
        expect(content).to match(/password\s+substack\s+postlogin/)
      }
    end

    it 'renders /etc/sysconfig/init' do
      expect(chef_run).to render_file('/etc/sysconfig/init').with_content(/umask\s+027/)
    end

    it 'renders /etc/pam.d/system-auth-ac' do
      expect(chef_run).to render_file('/etc/pam.d/system-auth-ac').with_content { |content|
        expect(content).to match(/auth\s+required\s+pam_tally2.so\s+deny=5\s+unlock_time=900\s+no_magic_root/)
        expect(content).to match(/password\s+requisite\s+pam_cracklib.so\s+try_first_pass\s+retry=3\s+minlen=14\s+dcredit=-1\s+ucredit=-1\s+ocredit=-1\s+lcredit=-1/)
        expect(content).to match(/password\s+sufficient\s+pam_unix.so\s+sha512\s+shadow\s+nullok\s+try_first_pass\s+use_authtok\s+remember=24/)
      }
    end

    it 'renders /etc/pam.d/password-auth-ac' do
      expect(chef_run).to render_file('/etc/pam.d/password-auth-ac').with_content { |content|
        expect(content).to match(/auth\s+required\s+pam_tally2.so\s+deny=5\s+unlock_time=900\s+no_magic_root/)
        expect(content).to match(/password\s+requisite\s+pam_cracklib.so\s+try_first_pass\s+retry=3\s+minlen=14\s+dcredit=-1\s+ucredit=-1\s+ocredit=-1\s+lcredit=-1/)
        expect(content).to match(/password\s+sufficient\s+pam_unix.so\s+sha512\s+shadow\s+nullok\s+try_first_pass\s+use_authtok\s+remember=24/)
      }
    end

    it 'renders /etc/login.defs' do
      expect(chef_run).to render_file('/etc/login.defs').with_content { |content|
        expect(content).to match(/^ENCRYPT_METHOD\s+SHA512$/)
        expect(content).to match(/^UMASK\s+077$/)
        expect(content).to match(/^PASS_MAX_DAYS\s+90$/)
        expect(content).to match(/^PASS_MIN_DAYS\s+7$/)
        expect(content).to match(/^PASS_WARN_AGE\s+7$/)
      }
    end

    it 'renders /etc/bashrc' do
      expect(chef_run).to render_file('/etc/bashrc').with_content(/umask\s+022/)
    end

    it 'renders /etc/modprobe.d/CIS.conf' do
      expect(chef_run).to render_file('/etc/modprobe.d/CIS.conf').with_content { |content|
        expect(content).to match(%r{install\s+cramfs\s+/bin/true})
        expect(content).to match(%r{install\s+udf\s+/bin/true})
        expect(content).to match(%r{install\s+squashfs\s+/bin/true})
      }
    end

    it 'renders /etc/sysctl.conf' do
      expect(chef_run).to render_file('/etc/sysctl.conf').with_content { |content|
        expect(content).to match(/kernel.randomize_va_space\s+=\s+2/)
        expect(content).to match(/fs.suid_dumpable\s+=\s+0/)
      }
    end

    it 'renders /etc/security/limits.conf' do
      expect(chef_run).to render_file('/etc/security/limits.conf').with_content(/\*\s+hard\s+core\s+0/)
    end
  end
end
