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

describe file('/etc/profile') do
  its('content') { should match(/umask\s+022/) }
end

describe file('/etc/sysconfig/init') do
  its('content') { should match(/umask\s+027/) }
end

describe file('/etc/bashrc') do
  its('content') { should match(/umask\s+022/) }
end

describe file('/etc/modprobe.d/CIS.conf') do
  its('content') { should match(%r{install\s+cramfs\s+/bin/true}) }
end
describe file('/etc/modprobe.d/CIS.conf') do
  its('content') { should match(%r{install\s+squashfs\s+/bin/true}) }
end
describe file('/etc/modprobe.d/CIS.conf') do
  its('content') { should match(%r{install\s+udf\s+/bin/true}) }
end

describe file('/etc/sysctl.conf') do
  its('content') { should match(/kernel.randomize_va_space\s+=\s+2/) }
end
describe file('/etc/sysctl.conf') do
  its('content') { should match(/fs.suid_dumpable\s+=\s+0/) }
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
