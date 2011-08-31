class bluetooth($enable=true) {
  if $enable {
    Package['bluez-libs'] -> Package['bluez-utils'] -> Service['hidd']
  } else {
    Package['bluez-libs'] <- Package['bluez-utils'] <- Service['hidd']
  }

  package { ['bluez-libs','bluez-utils']:
    ensure => $enable ? {
      true  => 'present',
      false => 'absent',
    },
  }

  service { "hidd":
    ensure    => $enable,
    enable    => $enable,
    hasstatus => true,
    status    => 'source /etc/init.d/functions status hidd',
  }
}
