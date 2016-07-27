describe file('/etc/securetty') do
  its('content') { should match(/\Atty1\ntty2\ntty3\ntty4\ntty5\ntty6\ntty7\ntty8\ntty9\ntty10\ntty11\nttyS0\Z/) }
end
