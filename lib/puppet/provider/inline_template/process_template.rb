require 'erb'
                                                         
config_one = "i am number one"
config_two = 125676588

template = ERB.new(File.read("config.erb"))
template_content = template.result(binding)

File.open("config.output", "w") do |file|
  file.puts template_content
end