apt_update 'update'

motd_tail '/etc/motd.tail.josh' do
  action :create
end

motd_tail '/etc/motd.tail.noah' do
  action :create
  template_source 'motd.tail.noah.erb'
end

motd_tail '/etc/motd.tail.bob' do
  action :create
  template_source   'motd.tail.bob.erb'
  template_cookbook 'motd-custom'
end
