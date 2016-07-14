#
# Cookbook Name:: base_hardening
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'base_hardening::default' do
  context 'When all attributes are default on RHEL family' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.node.automatic['os'] = 'linux'
    runner.node.automatic['platform_family'] = 'rhel'
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  it 'includes the openssh recipe' do
    expect(chef_run).to include_recipe('openssh')
  end

  it 'includes the rhel recipe' do
    expect(chef_run).to include_recipe('base_hardening::rhel')
  end

  end
end
