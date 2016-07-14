describe file('/etc/pam.d/system-auth-ac') do
  its('content') { should match(/auth\s+required\s+pam_tally2.so\s+deny=5\s+unlock_time=900\s+no_magic_root/) }
end
describe file('/etc/pam.d/system-auth-ac') do
  its('content') { should match(/password\s+requisite\s+pam_cracklib.so\s+try_first_pass\s+retry=3\s+minlen=8\s+dcredit=-1\s+ucredit=-1\s+ocredit=-1\s+lcredit=-1/) }
end
describe file('/etc/pam.d/system-auth-ac') do
  its('content') { should match(/password\s+sufficient\s+pam_unix.so\s+sha512\s+shadow\s+nullok\s+try_first_pass\s+use_authtok\s+remember=24/) }
end

describe file('/etc/pam.d/password-auth-ac') do
  its('content') { should match(/auth\s+required\s+pam_tally2.so\s+deny=5\s+unlock_time=900\s+no_magic_root/) }
end
describe file('/etc/pam.d/password-auth-ac') do
  its('content') { should match(/password\s+requisite\s+pam_cracklib.so\s+try_first_pass\s+retry=3\s+minlen=8\s+dcredit=-1\s+ucredit=-1\s+ocredit=-1\s+lcredit=-1/) }
end
describe file('/etc/pam.d/password-auth-ac') do
  its('content') { should match(/password\s+sufficient\s+pam_unix.so\s+sha512\s+shadow\s+nullok\s+try_first_pass\s+use_authtok\s+remember=24/) }
end

describe file('/etc/pam.d/passwd') do
  its('content') { should match(/auth\s+include\s+system-auth/) }
end
describe file('/etc/pam.d/passwd') do
  its('content') { match(/account\s+include\s+system-auth/) }
end
describe file('/etc/pam.d/passwd') do
  its('content') { match(/password\s+include\s+system-auth/) }
end
describe file('/etc/pam.d/passwd') do
  its('content') { match(/-password\s+optional\s+pam_gnome_keyring.so\s+use_authtok/) }
end
describe file('/etc/pam.d/passwd') do
  its('content') { match(/password\s+substack\s+postlogin/) }
end
