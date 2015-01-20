# == Class solo::params
#
# This class is meant to be called from solo.
# It sets variables according to platform.
#
class solo::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'solo'
      $service_name = 'solo'
    }
    'RedHat', 'Amazon': {
      $package_name = 'solo'
      $service_name = 'solo'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
