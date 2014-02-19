#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), 'checkFile'))
require File.expand_path(File.join(File.dirname(__FILE__), 'VirtualMachines'))

mh = CheckFile.new
mh.ExistVMS

mz = VirtualMachines.new
machines = mz.AddMachines

mz.ExportMachine(machines[0])

# puts mz.ListMachines
# puts mz.AnyMachines(mz.AddMachines)

v1 = ARGV[0]

# $?.exitstatus