directory '/etc/ssh'

cookbook_file '/etc/ssh/sshd_config' do
  mode '00600'
end
