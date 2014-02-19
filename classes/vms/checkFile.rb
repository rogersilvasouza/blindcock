#!/usr/bin/env ruby
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