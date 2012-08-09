
action :add do
  filename = "#{node[:dhcp][:config_dir]}/hosts.d/#{new_resource.hostname}.conf"
  template filename do
    cookbook "dhcp"
    source "host.conf.erb"
    variables(
      :hostname => new_resource.hostname,
      :options => new_resource.options,
      :parameters => new_resource.parameters
    )
    owner "root"
    group "root"
    mode 0644
    notifies :restart, resources(:service => node[:dhcp][:package]), :delayed
  end
  #utils_line "include \"#{filename}\";" do
  #  action :add
  #  file "#{node[:dhcp][:config_dir]}/hosts.d/host_list.conf"
  #  notifies :restart, resources(:service => node[:dhcp][:package]), :delayed
  #end
end

action :remove do
  filename = "#{node[:dhcp][:config_dir]}/hosts.d/#{new_resource.name}.conf"
  if ::File.exists?(filename)
    Chef::Log.info "Removing #{new_resource.name} host from /etc/dhcp3/hosts.d/"
    file filename do
      action :delete
      notifies :restart, resources(:service => node[:dhcp][:package]), :delayed
    end
    new_resource.updated_by_last_action(true)
  end
  #utils_line "include \"#{filename}\";" do
  #  action :remove
  #  file "#{node[:dhcp][:config_dir]}/hosts.d/host_list.conf"
  #  notifies :restart, resources(:service => node[:dhcp][:package]), :delayed
  #end
end

