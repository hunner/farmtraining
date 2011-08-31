class bluetooth::disable inherits bluetooth {
  Package['bluez-libs'] {
    ensure => absent,
    before => undef,
    #before => Package['bluez-libs'],
  }

  Package['bluez-utils'] {
    ensure => absent,
    before => undef,
  }

  Service['hidd'] {
    ensure => stopped,
    enable => false,
    #before => Package['bluez-libs'],
  }
}
