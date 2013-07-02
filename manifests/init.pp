# Class: inline_template
#
# This module is provided as an example to the custom inline_template provider/type.
#
# The purpose of this module is to process erb templates that exist on the local node independent of the puppetmaster.
#
# Parameters: none
#
# Actions:
#
# Requires: A string or hash to pass through to the provider/type
#
# eg. $config_hash = { config_one => 'config1', config_two => 'config2' }
#
# Sample Usage:
# #  inline_template { "/etc/config/example.conf":
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
