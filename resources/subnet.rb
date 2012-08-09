
actions :add, :remove

attribute :subnet, :kind_of => String, :name_attribute => true
attribute :netmask, :kind_of => String
attribute :ranges, :kind_of => Array, :default => []
attribute :options, :kind_of => Hash, :default => {}
attribute :parameters, :kind_of => Hash, :default => {}
attribute :groups, :kind_of => Array, :default => []
