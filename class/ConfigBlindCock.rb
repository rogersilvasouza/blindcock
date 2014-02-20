#!/usr/bin/env ruby

require 'FileUtils'

class ConfigBlindCock

    def initialize

		system("VBoxManage list vms > .vms")

	end

	def self.CreateVMS

		system("VBoxManage list vms > .vms")

	end

	def RecreateVMS

        FileUtils.rm_rf ".vms"
		system("VBoxManage list vms > .vms")
		puts "Configuration file recreated"

	end

	def ExistVMS

		file = File.exist?(".vms");

		if file

		else
			self.class.CreateVMS
		end

		return true

	end

end
