class bluetooth {
  package { ['bluez-libs','bluez-utils']:
    ensure => present,
    before => Service["hidd"],
  }

  service { "hidd":
    ensure    => running,
    enable    => true,
    hasstatus => true,
    status    => 'source /etc/init.d/functions status hidd',
  }
}
