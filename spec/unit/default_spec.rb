require 'spec_helper'

describe 'motd-tail::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu',
                               step_into: 'motd_tail').converge(described_recipe)
  end

  it 'creates an motd' do
    expect(chef_run).to create_motd_tail('/etc/motd.tail')
  end
end
