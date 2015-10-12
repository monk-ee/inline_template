require 'erb'

Puppet::Type.type(:inline_template).provide(:inline_template) do
  desc "Process a local ERB Template"

  def exists?
    # better check that the local template exists
    return false unless File.exists?("#{@resource[:source]}")
    if (File.exists?("#{@resource[:name]}"))
      template = ERB.new(File.read("#{@resource[:source]}"))
      template_content = template.result(binding).strip
      currentfile = File.open("#{@resource[:name]}", "r:bom|utf-8")
      currentfile_content = currentfile.read
      current_content = currentfile_content.strip
      currentfile.close
      if(current_content != template_content)
        File.delete("#{@resource[:name]}")
      end
    end
    if (@resource[:mode] != "" && File.exists?("#{@resource[:name]}"))
      File.chmod(Integer("#{@resource[:mode]}"),"#{@resource[:name]}")
    end
  end

  def create
    #ok grab the local params and pass them into templater
    template_create = ERB.new(File.read("#{@resource[:source]}"))
    template_create_content = template_create.result(binding)
    File.open("#{@resource[:name]}", "w") do |file|
      file.puts template_create_content
    end
    #now set mode if it exists
    if @resource[:mode] != ""
      File.chmod(Integer("#{@resource[:mode]}"),"#{@resource[:name]}")
    end
    #now set owner if it exists
    #only supports integers
    #unless defined?(@resource[:owner]) && defined?(@resource[:group])
    #File.chown(@resource[:owner],@resource[:group],"#{@resource[:name]}")
    #end
  end

  def destroy
    #check the file is there to delete
    return false unless File.exists?("#{@resource[:name]}")
    # ok toast it - hope for correct permissions
    File.delete("#{@resource[:name]}")
  end


end
