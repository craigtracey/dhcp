
actions :add, :remove

attribute :name, :kind_of => String, :name_attribute => true
attribute :options, :kind_of => Hash, :default => {}
attribute :parameters, :kind_of => Hash, :default => {}
attribute :hosts, :kind_of => Array, :default => []
