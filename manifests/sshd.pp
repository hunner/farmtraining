package { 'openssh-server':
  ensure => present,
}
file { '/etc/ssh/sshd_config':
  ensure  => present,
  owner   => 'root',
  group   => 'root',
  mode    => '0600',
  source  => '/etc/puppetlabs/puppet/files/sshd_config',
  require => Package["openssh-server"],
  notify  => Service["sshd"],
}
service { 'sshd':
  ensure     => running,
  hasrestart => true,
  hasstatus  => true,
  enable     => true,
  require    => Package["openssh-server"],
}
