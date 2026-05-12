# frozen_string_literal: true

provides :motd_tail
unified_mode true
default_action :create

property :path, String, name_property: true
property :template_source, String, default: 'motd.tail.erb'
property :template_cookbook, String, default: 'motd-tail'
property :additional_text, [String, nil]
property :manage_update_motd, [true, false], default: true
property :update_motd_package, String, default: 'update-motd'
property :update_motd_script_path, String, default: '/etc/update-motd.d/99-chef-info'
property :update_motd_template_source, String, default: '99-chef_info.erb'

action :create do
  template new_resource.path do
    source new_resource.template_source
    cookbook new_resource.template_cookbook
    mode '0644'
    owner 'root'
    group 'root'
    backup 0
    variables(additional_text: new_resource.additional_text)
    action :create
  end

  if new_resource.manage_update_motd
    package new_resource.update_motd_package

    template new_resource.update_motd_script_path do
      source new_resource.update_motd_template_source
      cookbook 'motd-tail'
      mode '0755'
      owner 'root'
      group 'root'
      variables(path: new_resource.path)
    end
  end
end

action :delete do
  file new_resource.path do
    action :delete
  end

  file new_resource.update_motd_script_path do
    action :delete
  end
end
