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
#    mode    => 0644,
#    configuration => $config_hash,
#  }
#
class inline_template {
  $config_hash = {
    config_one => 'config1',
    config_two => 'config2'
  }

  case $operatingsystem {
    'Solaris'           : {
      $local_template = "/tmp/config.erb"
      $local_output = "/tmp/config.example"
    }
    # apply the solaris class
    'RedHat', 'CentOS'  : {
      $local_template = "/tmp/config.erb"
      $local_output = "/tmp/config.example"
    }
    # apply the redhat class
    /^(Debian|Ubuntu)$/ : {
      $local_template = "/tmp/config.erb"
      $local_output = "/tmp/config.example"
    }
    # apply the debian class
    default             : {
      $local_template = "C:/Windows/Temp/config.erb"
      $local_output = "C:/Windows/Temp/config.example"
    }
    # apply the generic class which in this case is windows - a bit dumb but reliable
  }

  file { $local_template:
    ensure => present,
    source => "puppet:///modules/inline_template/config.erb",
    notify => Inline_template[$local_output],
  }

  inline_template { $local_output:
    ensure        => present,
    source        => $local_template,
    configuration => $config_hash,
    mode          => 0644,
    require       => File[$local_template],
  }
}
