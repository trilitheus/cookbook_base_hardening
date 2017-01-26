describe sshd_config('/etc/ssh/sshd_config') do
  its('Protocol') { should eq '2' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('ChallengeResponseAuthentication') { should eq 'no' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('UsePAM') { should eq 'yes' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('SyslogFacility') { should eq 'AUTHPRIV' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('LogLevel') { should eq 'INFO' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('PasswordAuthentication') { should eq 'no' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('GssapiAuthentication') { should eq 'yes' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('PermitRootLogin') { should eq 'no' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('KexAlgorithms') { should eq 'diffie-hellman-group1-sha1,diffie-hellman-group-exchange-sha256' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('Ciphers') { should eq 'aes256-ctr,aes192-ctr,aes128-ctr' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('MACs') { should eq 'hmac-sha2-512,hmac-sha2-256' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('X11Forwarding') { should eq 'no' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('MaxAuthTries') { should eq '4' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('HostbasedAuthentication') { should eq 'no' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('PermitEmptyPasswords') { should eq 'no' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('PermitUserEnvironment') { should eq 'no' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('ClientAliveInterval') { should eq '300' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('ClientAliveCountMax') { should eq '0' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('IgnoreRhosts') { should eq 'yes' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('AllowUsers') { should eq 'vagrant centos' }
end
describe sshd_config('/etc/ssh/sshd_config') do
  its('Banner') { should eq '/etc/issue' }
end
