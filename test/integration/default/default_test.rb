# InSpec test for recipe apache::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

if os.family == 'debian'
  describe user('www-data') do
    it { should exist }
  end

  describe package('apache2') do
    it { should be_installed }
  end

  describe service('apache2') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

  describe command('curl localhost') do
    its('stdout') { should match /Hello/ }
    its('stdout') { should match /ubuntu/ }
  end

elsif os.family == 'redhat'
  describe user('apache') do
    it { should exist }
  end

  describe package('httpd') do
    it { should be_installed }
  end

  describe service('httpd') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

  describe command('curl localhost') do
    its('stdout') { should match /Hello/ }
    its('stdout') { should match /centos/ }
  end
end

# This is an example test, replace it with your own test.
describe port(80) do
  it { should be_listening }
end
