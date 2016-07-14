describe kernel_module('cramfs') do
  it { should_not be_loaded }
end

check_cramfs = command('/sbin/modprobe -n -v cramfs')
describe check_cramfs do
  its('stdout') { should match %r{install /bin/true} }
end

describe kernel_module('squashfs') do
  it { should_not be_loaded }
end

check_squashfs = command('/sbin/modprobe -n -v squashfs')
describe check_squashfs do
  its('stdout') { should match %r{install /bin/true} }
end

describe kernel_module('udf') do
  it { should_not be_loaded }
end

check_udf = command('/sbin/modprobe -n -v udf')
describe check_udf do
  its('stdout') { should match %r{install /bin/true} }
end
