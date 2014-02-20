#!/usr/bin/env ruby

	require File.expand_path(File.join(File.dirname(__FILE__), 'class/ConfigBlindCock'))
	require File.expand_path(File.join(File.dirname(__FILE__), 'class/VirtualMachines'))

	config   = ConfigBlindCock.new
	machines = VirtualMachines.new

	option  = ARGV[0]
	option2 = ARGV[1]
	option3 = ARGV[2]

	if option == "init"

        config.ExistVMS

	elsif option == "-v"

		puts "Version 0.1"

	elsif option == "-l"

		machines.ListMachines

	elsif option == "-rc"

	    config.RecreateVMS

	elsif option == "-e"

		if option2

			if config.ExistVMS

				machines.CheckMachineAvaliabilty(option2)

				if option3

					if File.directory?(option3)

						machines.ExportMachine(option2, option3)
						machines.RemoveExportedMachine(option2)
						exit

					else

						puts "The directory entered does not exist, please inform an existing"
						exit

					end

				else

					puts "Please enter the output file"
					exit

				end

			end

		end

	end

# mh = CheckFile.new
# mh.ExistVMS

# mz = VirtualMachines.new
# machines = mz.AddMachines

# mz.ExportMachine(machines[0])

# puts mz.ListMachines
# puts mz.AnyMachines(mz.AddMachines)



# $?.exitstatus