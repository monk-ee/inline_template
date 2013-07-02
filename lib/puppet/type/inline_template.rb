Puppet::Type.newtype(:inline_template) do
  @doc = "Process a local ERB Template"

  newparam :name, :namevar => true do
    desc "The local filesystem product of the Local Template"
  end

  newparam :source do
    desc "The local filesystem source of the Local Template"
  end
 
   newparam :configuration do
    desc "The local filesystem source of the Local Template"
  end
   
  ensurable do
  	defaultvalues
  	defaultto :present
  end
   
end
