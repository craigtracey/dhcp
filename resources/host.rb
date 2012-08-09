
actions :add, :remove

attribute :hostname, :kind_of => String, :name_attribute => true
attribute :options, :kind_of => Hash, :default => {}
attribute :parameters, :kind_of => Hash, :default => {}
