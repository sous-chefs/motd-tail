# frozen_string_literal: true

control 'motd-tail-default-01' do
  impact 1.0
  title 'MOTD tail file is rendered'

  describe package('update-motd') do
    it { should be_installed }
  end

  describe file('/etc/motd.tail') do
    it { should exist }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('mode') { should cmp '0644' }
    its('content') { should include 'Authorized access only' }
  end

  describe file('/etc/update-motd.d/99-chef-info') do
    it { should exist }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('mode') { should cmp '0755' }
    its('content') { should include 'cat /etc/motd.tail' }
  end
end
