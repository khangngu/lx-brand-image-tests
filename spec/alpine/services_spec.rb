require 'spec_helper'

describe service('crond') do
  it { should be_enabled }
  it { should be_running }
end

describe service('sshd') do
  it { should be_enabled }
  it { should be_running }
end

describe service('local') do
  it { should be_enabled }
  it { should be_running }
end
