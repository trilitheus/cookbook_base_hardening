describe sshd_config('/etc/ssh/sshd_config') do
  its('Protocol') { should eq '2' }
  its('ChallengeResponseAuthentication') { should eq 'no' }
  its('UsePAM') { should eq 'yes' }
  its('SyslogFacility') { should eq 'AUTHPRIV' }
  its('LogLevel') { should eq 'INFO' }
  its('PasswordAuthentication') { should eq 'no' }
  its('GssapiAuthentication') { should eq 'yes' }
  its('PermitRootLogin') { should eq 'no' }
  its('KexAlgorithms') { should eq 'diffie-hellman-group-exchange-sha256' }
  its('Ciphers') { should eq 'aes256-ctr,aes192-ctr,aes128-ctr' }
  its('MACs') { should eq 'hmac-sha2-512,hmac-sha2-256' }
  its('X11Forwarding') { should eq 'no' }
  its('MaxAuthTries') { should eq '4' }
  its('HostbasedAuthentication') { should eq 'no' }
  its('PermitEmptyPasswords') { should eq 'no' }
  its('PermitUserEnvironment') { should eq 'no' }
  its('ClientAliveInterval') { should eq '300' }
  its('ClientAliveCountMax') { should eq '0' }
  its('IgnoreRhosts') { should eq 'yes' }
  its('AllowUsers') { should eq 'vagrant centos' }
  its('Banner') { should eq '/etc/issue' }
end
