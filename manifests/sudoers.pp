file { '/etc/sudoers':
  ensure => present,
  source => '/etc/puppetlabs/puppet/files/sudoers',
  owner  => 'root',
  group  => 'root',
  mode   => '0440',
}

file { '/etc/sudoers':
  ensure => absent,
}
