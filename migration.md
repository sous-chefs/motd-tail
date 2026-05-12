# Migration Guide

## Full Custom Resource Migration

The `motd-tail` cookbook no longer exposes recipes or node attributes as its
public API. Replace recipe usage with the `motd_tail` resource.

### Before

```ruby
run_list 'recipe[motd-tail]'

default['motd-tail']['additional_text'] = 'Authorized access only'
```

### After

```ruby
motd_tail '/etc/motd.tail' do
  additional_text 'Authorized access only'
end
```

The removed default recipe used to manage `/etc/motd.tail`. The resource now
models that behavior directly with explicit properties for the MOTD tail path,
custom template, additional text, and update-motd integration script.
