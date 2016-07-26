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

# CIS-6.1.4
template '/etc/crontab' do
  user 'root'
  group 'root'
  mode '00600'
end

%w(/etc/cron.hourly
   /etc/cron.daily
   /etc/cron.weekly
   /etc/cron.monthly
   /etc/cron.d
).each do |dir|
  directory dir do
    owner 'root'
    group 'root'
    mode '00700'
  end
end

%w(/etc/at.deny
   /etc/cron.deny
).each do |f|
  file f do
    action :delete
  end
end
