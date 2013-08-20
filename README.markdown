inline_template
===============

The purpose of this module is to process erb templates that exist on the local node independent of the puppetmaster.

This module is provided as an example to the custom inline_template provider/type.

# Supported Platforms #
The module has been tested on the following operating systems. Testing and patches for other platforms are welcomed.

+ RHEL 6.3 
+ RHEL 6.4
+ Windows Server 2008 R2 64bit

# Requires #
A string or hash to pass through to the provider/type eg.
 
	$config_hash = { config_one => 'config1', config_two => 'config2' }

# Sample Usage: #
	inline_template { "/etc/config/example.conf":
    	ensure  => present,
    	source  => "/etc/config/config.erb",
    	mode    => 0644,
    	configuration => $config_hash,
  	}

# Sample ERB #
	# This configuration file is managed by puppet
	# Filepath <%= resource[:name] %>
	config_value_one = <%= resource[:configuration]["config_one"] %>
	config_value_two = <%= resource[:configuration]["config_two"] %>


# License #
Copyright (c) 2012-2013 Talk to The Aliens Pty Ltd, 2013

This script is licensed under the Apache License, Version 2.0.
See http://www.apache.org/licenses/LICENSE-2.0.html for the full license text.

# Support #
Please log tickets and issues at our project site.

# Versions #
+ 0.1.0 initial release
+ 0.2.0 fixed the markdown on the readme, added windows support to the example
+ 0.3.0 added mode support