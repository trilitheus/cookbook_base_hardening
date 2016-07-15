# mode 644 files
%w{
  /etc/profile
  /etc/sysconfig/init
  /etc/login.defs
  /etc/bashrc
  /etc/sysctl.conf
  /etc/security/limits.conf
}.each do |tmpl|
  template tmpl do
  user 'root'
  group 'root'
  mode '00644'
  end
end

template '/etc/pam.d/passwd' do
  user 'root'
  group 'root'
  mode '00640'
end

%w(system-auth-ac password-auth-ac).each do |auth|
  template "/etc/pam.d/#{auth}" do
    source 'system-auth-ac.erb'
    user 'root'
    group 'root'
    mode '00640'
  end
end

file '/etc/cron.allow' do
  content 'root'
  user 'root'
  group 'root'
  mode '00400'
end

file '/etc/at.allow' do
  user 'root'
  group 'root'
  mode '00400'
end

template '/etc/modprobe.d/CIS.conf' do
  user 'root'
  group 'root'
  mode '00600'
end
