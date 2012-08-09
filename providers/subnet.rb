
action :add do
  filename = "#{node[:dhcp][:config_dir]}/subnets.d/#{new_resource.subnet}.conf"
  template filename do
    cookbook "dhcp"
    source "subnet.conf.erb"
    variables(
      :subnet => new_resource.subnet,
      :netmask => new_resource.netmask,
      :ranges => new_resource.ranges,
      :options => new_resource.options,
      :parameters => new_resource.parameters,
      :groups => new_resource.groups
    )
    owner "root"
    group "root"
    mode 0644
    notifies :restart, resources(:service => node[:dhcp][:package]), :delayed
  end
  #utils_line "include \"#{filename}\";" do
  #  action :add
  #  file "#{node[:dhcp][:config_dir]}/subnets.d/subnet_list.conf"
  #  notifies :restart, resources(:service => node[:dhcp][:package]), :delayed
  #end
end

action :remove do
  filename = "#{node[:dhcp][:config_dir]}/#{new_resource.name}.conf"
  if ::File.exists?(filename)
    Chef::Log.info "Removing #{new_resource.name} subnet from #{node[:dhcp][:config_dir]}/subnets.d/"
    file filename do
      action :delete
      notifies :restart, resources(:service => node[:dhcp][:package]), :delayed
    end
    new_resource.updated_by_last_action(true)
  end
  #utils_line "include \"#{filename}\";" do
  #  action :remove
  #  file "#{node[:dhcp][:config_dir]}/subnets.d/subnet_list.conf"
  #  notifies :restart, resources(:service => node[:dhcp][:package]), :delayed
  #end
end

