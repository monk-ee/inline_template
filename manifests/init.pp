# Class: inline_template
# 
# Supported Platforms
# The module has been tested on the following operating systems. Testing and patches for other platforms are welcomed.
#
# RHEL 6.3, RHEL6.4, Windows Server 2008 R2 64bit
#
# License
# Copyright (c) 2012-2013 Talk to The Aliens Pty Ltd, 2013
#
# This script is licensed under the Apache License, Version 2.0.
# See http://www.apache.org/licenses/LICENSE-2.0.html for the full license text.
#
# This module is provided as an example to the custom inline_template provider/type.
#
# The purpose of this module is to process erb templates that exist on the local node independent of the puppetmaster.
#
# Requires: A string or hash to pass through to the provider/type
#
# eg. $config_hash = { config_one => 'config1', config_two => 'config2' }
#
# Sample Usage:
#   inline_template { "/etc/config/example.conf":
#    ensure  => present,
#    source  => "/etc/config/config.erb",
#    configuration => $config_hash,
#  }
#
class inline_template {
  $config_hash = {
    config_one => 'config1',
    config_two => 'config2'
  }

  file { "/tmp/config.erb":
    ensure => present,
    source => "puppet:///modules/inline_template/config.erb",
    notify => Inline_template["/tmp/config.example"],
  }

  inline_template { "/tmp/config.example":
    ensure        => present,
    source        => "/tmp/config.erb",
    configuration => $config_hash,
    require       => File["/tmp/config.erb"],
  }
}
