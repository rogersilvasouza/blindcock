#!/usr/bin/env ruby

	require File.expand_path(File.join(File.dirname(__FILE__), 'checkFile'))
	require File.expand_path(File.join(File.dirname(__FILE__), 'VirtualMachines'))

	option = ARGV[0]

	if option == "-v"

		puts "Version 0.1"

	end

	if option == "-l"

		mc = VirtualMachines.new
		mc.ListMachines

	end

# mh = CheckFile.new
# mh.ExistVMS

# mz = VirtualMachines.new
# machines = mz.AddMachines

# mz.ExportMachine(machines[0])

# puts mz.ListMachines
# puts mz.AnyMachines(mz.AddMachines)



# $?.exitstatus