require 'spec_helper'

# Systemd overrides for systemd-timedated and systemd-hostnamed
# For CentOS 7+, Debian 8+ and Ubuntu 16.04+
# See:
#   - https://github.com/joyent/centos-lx-brand-image-builder/issues/5
#   - https://smartos.org/bugview/OS-5304

# TODO: This will fail on non-systemd distros. Need logic to address that.
# TODO: Move the command tests to common-lx?

describe file('/etc/systemd/system/systemd-timedated.service.d/override.conf') do
  it { should be_file }
  its(:content) { should match /[Service]/ }
  its(:content) { should match /PrivateTmp=no/ }
  its(:content) { should match /PrivateDevices=no/ }
  its(:content) { should match /PrivateNetwork=no/ }
  its(:content) { should match /ProtectSystem=no/ }
  its(:content) { should match /ProtectHome=no/ }
end

describe command('timedatectl') do
  its(:exit_status) { should eq 0 }
end

describe file('/etc/systemd/system/systemd-hostnamed.service.d/override.conf') do
  it { should be_file }
  its(:content) { should match /[Service]/ }
  its(:content) { should match /PrivateTmp=no/ }
  its(:content) { should match /PrivateDevices=no/ }
  its(:content) { should match /PrivateNetwork=no/ }
  its(:content) { should match /ProtectSystem=no/ }
  its(:content) { should match /ProtectHome=no/ }
end

describe command('hostnamectl') do
  its(:exit_status) { should eq 0 }
end