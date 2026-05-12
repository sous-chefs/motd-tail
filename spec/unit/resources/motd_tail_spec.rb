# frozen_string_literal: true

require 'spec_helper'

describe 'motd_tail' do
  step_into :motd_tail
  platform 'ubuntu', '24.04'

  context 'with default properties' do
    recipe do
      motd_tail '/etc/motd.tail'
    end

    it { is_expected.to create_motd_tail('/etc/motd.tail') }
    it { is_expected.to install_package('update-motd') }

    it do
      is_expected.to create_template('/etc/motd.tail').with(
        source: 'motd.tail.erb',
        cookbook: 'motd-tail',
        owner: 'root',
        group: 'root',
        mode: '0644',
        variables: { additional_text: nil }
      )
    end

    it do
      is_expected.to create_template('/etc/update-motd.d/99-chef-info').with(
        source: '99-chef_info.erb',
        cookbook: 'motd-tail',
        owner: 'root',
        group: 'root',
        mode: '0755',
        variables: { path: '/etc/motd.tail' }
      )
    end
  end

  context 'with custom text and template source' do
    recipe do
      motd_tail '/etc/motd.tail.custom' do
        additional_text 'Authorized access only'
        template_source 'motd.tail.custom.erb'
        template_cookbook 'test'
      end
    end

    it do
      is_expected.to create_template('/etc/motd.tail.custom').with(
        source: 'motd.tail.custom.erb',
        cookbook: 'test',
        variables: { additional_text: 'Authorized access only' }
      )
    end
  end

  context 'without update-motd integration' do
    recipe do
      motd_tail '/etc/motd.tail' do
        manage_update_motd false
      end
    end

    it { is_expected.not_to install_package('update-motd') }
    it { is_expected.not_to create_template('/etc/update-motd.d/99-chef-info') }
  end

  context 'delete action' do
    recipe do
      motd_tail '/etc/motd.tail' do
        action :delete
      end
    end

    it { is_expected.to delete_file('/etc/motd.tail') }
    it { is_expected.to delete_file('/etc/update-motd.d/99-chef-info') }
  end
end
