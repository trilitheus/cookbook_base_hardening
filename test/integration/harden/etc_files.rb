describe limits_conf do
  its('*') { should include ['hard', 'core', '0'] }
end

describe login_defs do
  its('ENCRYPT_METHOD') { should eq 'SHA512'}
  its('UMASK') { should eq '077' }
end

describe file('/etc/cron.allow') do
  it { should be_file }
  it { should exist }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should eq 0400 }
  its('content') { should eq 'root' }
end

describe file('/etc/at.allow') do
  it { should be_file }
  it { should exist }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should eq 0400 }
  its('content') { should eq '' }
end
