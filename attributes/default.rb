if (platform == "debian" and platform_version.to_f >= 6.0) or (platform == "ubuntu" and platform_version.to_f >= 12.04)
  set[:dhcp][:package] = "isc-dhcp-server"
  set[:dhcp][:config_dir] = "/etc/dhcp"
elsif platform == "debian" or platform == "ubuntu"
  set[:dhcp][:package] = "dhcp3-server"
  set[:dhcp][:config_dir] = "/etc/dhcp3"
else
  Chef::Log.error("Unsupported platform #{platform}")
end

default[:dhcp][:interfaces] = [ "eth0" ]

default[:dhcp][:allows] = []

default[:dhcp][:parameters] = {
  "default-lease-time" => "600",
  "max-lease-time" => "7200",
  "ddns-update-style" => "none",
  "log-facility" => "local7"
}

default[:dhcp][:options] = {
  "domain-name" => "\"example.org\"",
  "domain-name-servers" => ["ns1.example.org", "ns2.example.org"]
}
