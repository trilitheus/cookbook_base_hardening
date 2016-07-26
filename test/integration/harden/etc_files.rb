describe limits_conf do
  its('*') { should include %w(hard core 0) }
end

describe login_defs do
  its('ENCRYPT_METHOD') { should eq 'SHA512' }
end
describe login_defs do
  its('UMASK') { should eq '077' }
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
