require 'spec_helper'

describe 'base_hardening::issue_file' do
  context 'When all attributes are default on RHEL family docker container' do
    cached(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.node.automatic['virtualization']['system'] = 'docker'
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'created the file /etc/issue' do
      expect(chef_run).to create_cookbook_file('/etc/issue')
    end

  end
end
