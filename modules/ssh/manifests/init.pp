class ssh {
  package { 'openssh-server':
    ensure => present,
  }
  file { '/etc/ssh/sshd_config':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    source  => 'puppet:///modules/ssh/sshd_config',
    require => Package["openssh-server"],
    notify  => Service["sshd"],
  }
  service { 'sshd':
    ensure     => running,
    hasrestart => true,
    hasstatus  => true,
    enable     => true,
  }
}
