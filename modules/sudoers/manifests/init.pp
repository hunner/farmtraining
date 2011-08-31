class sudoers {
  file { '/etc/sudoers':
    ensure => present,
    source => 'puppet:///modules/sudoers/sudoers',
    owner  => 'root',
    group  => 'root',
    mode   => '0440',
  }
}
