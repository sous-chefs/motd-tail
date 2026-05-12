# frozen_string_literal: true

apt_update 'update'

motd_tail '/etc/motd.tail' do
  additional_text 'Authorized access only'
end
