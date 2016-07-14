#
# Cookbook Name:: base_hardening
# Spec:: rhel
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'base_hardening::rhel' do
  context 'When all attributes are default on RHEL family' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.node.automatic['os'] = 'linux'
      runner.node.automatic['platform_family'] = 'rhel'
      runner.node.automatic['platform_version'] = '7'
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'renders /etc/profile' do
      expect(chef_run).to render_file('/etc/profile').with_content(/umask\s+022/)
    end

    it 'renders /etc/pam.d/system-auth-ac' do
      expect(chef_run).to render_file('/etc/pam.d/system-auth-ac').with_content { |content|
        expect(content).to match(/auth\s+required\s+pam_tally2.so\s+deny=5\s+unlock_time=900\s+no_magic_root/)
        expect(content).to match(/password\s+requisite\s+pam_cracklib.so\s+try_first_pass\s+retry=3\s+minlen=8\s+dcredit=-1\s+ucredit=-1\s+ocredit=-1\s+lcredit=-1/)
        expect(content).to match(/password\s+sufficient\s+pam_unix.so\s+sha512\s+shadow\s+nullok\s+try_first_pass\s+use_authtok\s+remember=24/)
      }
    end

    it 'renders /etc/pam.d/password-auth-ac' do
      expect(chef_run).to render_file('/etc/pam.d/password-auth-ac').with_content { |content|
        expect(content).to match(/auth\s+required\s+pam_tally2.so\s+deny=5\s+unlock_time=900\s+no_magic_root/)
        expect(content).to match(/password\s+requisite\s+pam_cracklib.so\s+try_first_pass\s+retry=3\s+minlen=8\s+dcredit=-1\s+ucredit=-1\s+ocredit=-1\s+lcredit=-1/)
        expect(content).to match(/password\s+sufficient\s+pam_unix.so\s+sha512\s+shadow\s+nullok\s+try_first_pass\s+use_authtok\s+remember=24/)
      }
    end
  end
end
