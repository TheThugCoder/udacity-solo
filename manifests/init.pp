# == Class: solo
#
# Full description of class solo here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class solo (
  $package_name = $::solo::params::package_name,
  $service_name = $::solo::params::service_name,
) inherits ::solo::params {

  # validate parameters here

  class { '::solo::install': } ->
  class { '::solo::config': } ~>
  class { '::solo::service': } ->
  Class['::solo']
}
