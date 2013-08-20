Puppet::Type.newtype(:inline_template) do
  @doc = "Process a local ERB Template"

  newparam :name, :namevar => true do
    desc "The local filesystem product of the Local Template"
  end

  newparam :source do
    desc "The local filesystem source of the Local Template"
  end
  
  # @todo implement modes - including windows mode mapping
  #On non-Posix operating systems, there may be only the ability to make a file read-only or read-write.
  #In this case, the remaining permission bits will be synthesized to resemble typical values.
  #For instance, on Windows NT the default permission bits are 0644, which means read/write for owner,
  #read-only for all others. The only change that can be made is to make the file read-only, which is reported as 0444.
  newparam :mode do
    desc "The local filesystem product permissions mode"
  end
 
  ## @todo implement owner - including windows owner mapping
  #newparam :owner do
  #  desc "The local filesystem product owner"
  #end
   
  newparam :configuration do
    desc "The local filesystem source of the Local Template"
  end
   
  ensurable do
  	defaultvalues
  	defaultto :present
  end
   
end
