require 'erb'
		
Puppet::Type.type(:inline_template).provide(:inline_template) do
	desc "Process a local ERB Template"

	def exists?
		# better check that the local template exists
 		return false unless File.exists?("#{@resource[:source]}")
 		#we don't care if the end file exists
	end
	
	def create
		#ok grab the local params and pass them into templater
		template = ERB.new(File.read("#{@resource[:source]}"))
		template_content = template.result(binding)
		File.open("#{@resource[:name]}", "w") do |file|
  			file.puts template_content
		end
	end
	
	def destroy
		#check the file is there to delete
		return false unless File.exists?("#{@resource[:name]}")
		# ok toast it - hope for correct permissions
		File.delete("#{@resource[:name]}")
	end
	
  
end
