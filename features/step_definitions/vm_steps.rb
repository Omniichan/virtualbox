Given /I set the VM "(.+?)" to "(.+?)"/ do |key, value|
  VBoxManage.execute("modifyvm", @name, "--#{key}", value)
end

Given /I set the VM extra data "(.+?)" to "(.*?)"/ do |key, value|
  VBoxManage.execute("setextradata", @name, key, value)
end

Given /I delete the VM extra data "(.+?)"/ do |key|
  # Same as setting to empty
  Given %Q[I set the VM extra data "#{key}" to ""]
end

Given /I reload the VM$/ do
  Given %Q[I find a VM identified by "#{@name}"]
end

When /I find a VM identified by "(.+?)"/ do |name|
  @name = name
  @output = VBoxManage.vm_info(name)
  @model = VirtualBox::VM.find(name)
end

When /I reload the VM info$/ do
  @output = VBoxManage.vm_info(@name)
end

Then /the VM should not exist/ do
  @output.should be_empty
  @model.should be_nil
end

Then /the VM should exist/ do
  @output.should have_key("UUID")
  @model.should_not be_nil
end

Then /the BIOS properties should match/ do
  test_mappings(BIOS_MAPPINGS, @relationship, @output)
end

Then /the VM properties should match/ do
  test_mappings(VM_MAPPINGS, @model, @output)
end