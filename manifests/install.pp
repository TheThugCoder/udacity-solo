# == Class solo::install
#
# This class is called from solo for install.
#
class solo::install {

  package { $::solo::package_name:
    ensure => present,
  }
}
