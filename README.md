inline_template
===============

The purpose of this module is to process erb templates that exist on the local node independent of the puppetmaster.

This module is provided as an example to the custom inline_template provider/type.

#Requires#
A string or hash to pass through to the provider/type
eg. $config_hash = { config_one => 'config1', config_two => 'config2' }

#Sample Usage:#
  inline_template { "/etc/config/example.conf":
    ensure  => present,
    source  => "/etc/config/config.erb",
    configuration => $config_hash,
  }