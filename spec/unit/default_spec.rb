require 'spec_helper'

describe 'motd-tail::default' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') }

  it 'creates an motd' do
    expect(chef_run).to create_motd_tail('/etc/motd.tail')
  end
end
