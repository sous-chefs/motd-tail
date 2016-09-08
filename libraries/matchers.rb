if defined?(ChefSpec)
  ChefSpec.define_matcher :motd_tail

  def create_motd_tail(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:motd_tail, :create, resource_name)
  end

  def delete_motd_tail(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:motd_tail, :add, resource_name)
  end
end
