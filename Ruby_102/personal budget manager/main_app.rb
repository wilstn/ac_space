load 'interface_class.rb'

ash = Interface.new

ash.create_account
@@still_in = true
while @@still_in == true
  ash.show_menu
end
