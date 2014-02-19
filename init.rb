#!/usr/bin/env ruby

require 'classes/vms/virtualMachines.rb'

mh = CheckFile.new
# mh.ExistVMS

mz = VirtualMachines.new
machines = mz.AddMachines

mz.ExportMachine(machines[4])

# puts mz.ListMachines
# puts mz.AnyMachines(mz.AddMachines)

v1 = ARGV[0]

# $?.exitstatus