describe sshd_config('/etc/ssh/sshd_config') do
  its('ChallengeResponseAuthentication') { should eq 'no' }
  its('Ciphers') { should eq 'aes256-ctr,aes192-ctr,aes128-ctr' }
  its('GssapiAuthentication') { should eq 'yes' }
  its('KexAlgorithms') { should eq 'diffie-hellman-group-exchange-sha256' }
  its('LogLevel') { should eq 'VERBOSE' }
  its('MACs') { should eq 'hmac-sha2-512,hmac-sha2-256' }
  its('PasswordAuthentication') { should eq 'no' }
  its('PermitRootLogin') { should eq 'no' }
  its('Protocol') { should eq '2' }
  its('SyslogFacility') { should eq 'AUTHPRIV' }
  its('UsePAM') { should eq 'yes' }
end
