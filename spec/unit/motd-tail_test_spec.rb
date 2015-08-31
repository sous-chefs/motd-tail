require 'spec_helper'

describe 'motd-tail_test::default' do
  let(:chef_run) do
    ChefSpec::Runner.new(
      step_into: 'motd_tail'
    ).converge(described_recipe)
  end

  it 'creates an motd for josh' do
    expect(chef_run).to create_motd_tail('/etc/motd.tail.josh')
  end

  it 'steps into motd_tail for josh' do
    expect(chef_run).to create_template('/etc/motd.tail.josh').with(
      owner: 'root',
      group: 'root',
      mode: '0644'
    )
  end

  it 'creates an motd for noah' do
    expect(chef_run).to create_motd_tail('/etc/motd.tail.noah').with(
      template_source: 'motd.tail.noah.erb'
    )
  end

  it 'steps into motd_tail for noah' do
    expect(chef_run).to create_template('/etc/motd.tail.noah').with(
      owner: 'root',
      group: 'root',
      mode: '0644'
    )
  end
end
