#
# Cookbook Name:: base_hardening
# Spec:: cron
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'base_hardening::cron' do
  context 'When all attributes are default on RHEL family' do
    cached(:chef_run) do
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

    it 'creates /etc/cron.allow' do
      expect(chef_run).to create_file('/etc/cron.allow').with(
        user: 'root',
        group: 'root',
        mode: '00400',
        content: 'root'
      )
    end

    it 'creates /etc/at.allow' do
      expect(chef_run).to create_file('/etc/at.allow').with(
        user: 'root',
        group: 'root',
        mode: '00400',
        content: nil
      )
    end

    it 'sets the user/group and permissions on /etc/crontab' do
      expect(chef_run).to create_template('/etc/crontab').with(
        user: 'root',
        group: 'root',
        mode: '00600'
      )
    end

    it 'sets the user/group and permissions on /etc/cron.hourly' do
      expect(chef_run).to create_directory('/etc/cron.hourly').with(
        user: 'root',
        group: 'root',
        mode: '00700'
      )
    end

    it 'sets the user/group and permissions on /etc/cron.daily' do
      expect(chef_run).to create_directory('/etc/cron.daily').with(
        user: 'root',
        group: 'root',
        mode: '00700'
      )
    end

    it 'sets the user/group and permissions on /etc/cron.weekly' do
      expect(chef_run).to create_directory('/etc/cron.weekly').with(
        user: 'root',
        group: 'root',
        mode: '00700'
      )
    end

    it 'sets the user/group and permissions on /etc/cron.monthly' do
      expect(chef_run).to create_directory('/etc/cron.monthly').with(
        user: 'root',
        group: 'root',
        mode: '00700'
      )
    end

    it 'sets the user/group and permissions on /etc/cron.d' do
      expect(chef_run).to create_directory('/etc/cron.d').with(
        user: 'root',
        group: 'root',
        mode: '00700'
      )
    end

    it 'ensures cron.deny is deleted' do
      expect(chef_run).to delete_file('/etc/cron.deny')
    end

    it 'ensures at.deny is deleted' do
      expect(chef_run).to delete_file('/etc/at.deny')
    end
  end
end
