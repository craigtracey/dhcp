
actions :add, :remove

attribute :hostname, :kind_of => String, :name_attribute => true
attribute :macaddress, :kind_of => String
attribute :ipaddress, :kind_of => String
attribute :options, :kind_of => Array, :default => []

