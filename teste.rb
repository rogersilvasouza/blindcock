#!/usr/bin/env ruby

require 'FileUtils'

class CheckFile

	def ExistVMS

		file = File.exist?("VMS");

		if file
			puts "arquivo existe"
		else
			puts "arquivo nao existe"
			system("VBoxManage list vms > VMS")
			puts "arquivo Criado"
		end

	end

end

class VirtualMachines

	def AddMachines

		array = Array.new
		file  = File.new("VMS", "r")

		while (line = file.gets)
			line, *rest = line.split('{')
			line = line.delete!('"')
			line = line.strip
			array.push(line)
		end

		file.close

		return array

	end

	def ListMachines

		array = Array.new
		file  = File.new("VMS", "r")

		while (line = file.gets)
			line, *rest = line.split('{')
			array.push(line.delete!('"'))
		end

		file.close

		puts array

	end

    def AnyMachines(machines)

		return machines.length

	end

	def ExportMachine(machine)

		machine = machine.strip

		if !File.directory?(machine)

			Dir.mkdir(machine)

		else

            FileUtils.rm_rf "#{machine}"
			Dir.mkdir(machine)

		end

		if !File.directory?('#{machine}/metadata.json')

			file = File.new("#{machine}/metadata.json", "w")
			file.write("{
  \"provider\": \"virtualbox\"
}")
            file.close

        else

			file = File.new("#{machine}/metadata.json", "w")
			file.write("{
  \"provider\": \"virtualbox\"
}")
            file.close

		end

		if !File.directory?('tempmachine')

			system("vboxmanage showvminfo #{machine} > .tempmachine")

			file = File.new(".tempmachine", "r")

			while (line = file.gets)
				if line.match("NIC 1:")
					first, *rest  = line.split('NIC 1:           MAC: ')
					mac, *rest = rest[0].split(',')
				end
			end

			file.close

		end

		file = File.new("#{machine}/Vagrantfile", "w")
		file.write("Vagrant.configure(\"2\") do |config| 
	config.vm.base_mac = \"#{mac}\" 
end")

        file.close

        # system("VBoxManage export #{machine} --output #{machine}/box.ovf")

        # system("tar -cvzf #{machine}/#{machine}.box ./*")

        # system("tar -cvzf --quiet #{machine}/#{machine}.box ./*")

	end

end

mh = CheckFile.new
# mh.ExistVMS

mz = VirtualMachines.new
machines = mz.AddMachines

mz.ExportMachine(machines[4])

# puts mz.ListMachines
# puts mz.AnyMachines(mz.AddMachines)

v1 = ARGV[0]

# $?.exitstatus