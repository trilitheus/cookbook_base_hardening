describe limits_conf do
  its('*') { should include %w(hard core 0) }
end

describe file('/etc/cron.allow') do
  it { should be_file }
end
describe file('/etc/cron.allow') do
end
describe file('/etc/cron.allow') do
  its('owner') { should eq 'root' }
end
describe file('/etc/cron.allow') do
  its('group') { should eq 'root' }
end
describe file('/etc/cron.allow') do
  its('mode') { should eq 0400 }
end
describe file('/etc/cron.allow') do
  its('content') { should eq 'root' }
end

describe file('/etc/at.allow') do
  it { should be_file }
end
describe file('/etc/at.allow') do
  it { should exist }
end
describe file('/etc/at.allow') do
  its('owner') { should eq 'root' }
end
describe file('/etc/at.allow') do
  its('group') { should eq 'root' }
end
describe file('/etc/at.allow') do
  its('mode') { should eq 0400 }
end
describe file('/etc/at.allow') do
  its('content') { should eq '' }
end

describe file('/etc/cron.hourly') do
  it { should be_directory }
end
describe file('/etc/cron.hourly') do
  it { should exist }
end
describe file('/etc/cron.hourly') do
  its('owner') { should eq 'root' }
end
describe file('/etc/cron.hourly') do
  its('group') { should eq 'root' }
end
describe file('/etc/cron.hourly') do
  its('mode') { should eq 0700 }
end

describe file('/etc/cron.daily') do
  it { should be_directory }
end
describe file('/etc/cron.daily') do
  it { should exist }
end
describe file('/etc/cron.daily') do
  its('owner') { should eq 'root' }
end
describe file('/etc/cron.daily') do
  its('group') { should eq 'root' }
end
describe file('/etc/cron.daily') do
  its('mode') { should eq 0700 }
end

describe file('/etc/cron.weekly') do
  it { should be_directory }
end
describe file('/etc/cron.weekly') do
  it { should exist }
end
describe file('/etc/cron.weekly') do
  its('owner') { should eq 'root' }
end
describe file('/etc/cron.weekly') do
  its('group') { should eq 'root' }
end
describe file('/etc/cron.weekly') do
  its('mode') { should eq 0700 }
end

describe file('/etc/cron.monthly') do
  it { should be_directory }
end
describe file('/etc/cron.monthly') do
  it { should exist }
end
describe file('/etc/cron.monthly') do
  its('owner') { should eq 'root' }
end
describe file('/etc/cron.monthly') do
  its('group') { should eq 'root' }
end
describe file('/etc/cron.monthly') do
  its('mode') { should eq 0700 }
end

describe file('/etc/cron.d') do
  it { should be_directory }
end
describe file('/etc/cron.d') do
  it { should exist }
end
describe file('/etc/cron.d') do
  its('owner') { should eq 'root' }
end
describe file('/etc/cron.d') do
  its('group') { should eq 'root' }
end
describe file('/etc/cron.d') do
  its('mode') { should eq 0700 }
end

describe file('/etc/crontab') do
  its('owner') { should eq 'root' }
end
describe file('/etc/crontab') do
  its('group') { should eq 'root' }
end
describe file('/etc/crontab') do
  its('mode') { should eq 0600 }
end

describe file('/etc/at.deny') do
  it { should_not exist }
end

describe file('/etc/cron.deny') do
  it { should_not exist }
end
