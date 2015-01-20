# == Class solo::service
#
# This class is meant to be called from solo.
# It ensure the service is running.
#
class solo::service {

  service { $::solo::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
