# motd_tail

Manages an Ubuntu MOTD tail file and an optional `/etc/update-motd.d` script.

## Actions

| Action    | Description                                  |
|-----------|----------------------------------------------|
| `:create` | Creates the MOTD tail file and update script |
| `:delete` | Removes the MOTD tail file and update script |

## Properties

| Property                      | Type        | Default                              | Description                                 |
|-------------------------------|-------------|--------------------------------------|---------------------------------------------|
| `path`                        | String      | name property                        | MOTD tail file path                         |
| `template_source`             | String      | `'motd.tail.erb'`                    | Template source for the MOTD tail file      |
| `template_cookbook`           | String      | `'motd-tail'`                        | Cookbook containing the MOTD tail template  |
| `additional_text`             | String, nil | `nil`                                | Extra text appended to the default template |
| `manage_update_motd`          | true, false | `true`                               | Whether to manage update-motd integration   |
| `update_motd_package`         | String      | `'update-motd'`                      | Package that provides update-motd behavior  |
| `update_motd_script_path`     | String      | `'/etc/update-motd.d/99-chef-info'`  | Script path read by pam_motd                |
| `update_motd_template_source` | String      | `'99-chef_info.erb'`                 | Template source for the update-motd script  |

## Examples

### Default MOTD Tail

```ruby
motd_tail '/etc/motd.tail'
```

### Add Custom Text

```ruby
motd_tail '/etc/motd.tail' do
  additional_text 'Authorized access only'
end
```

### Custom Template

```ruby
motd_tail '/etc/motd.tail' do
  template_source 'company-motd.erb'
  template_cookbook 'company_base'
end
```

### Static File Only

```ruby
motd_tail '/etc/motd.tail' do
  manage_update_motd false
end
```
