class sudo {
  file { '/tmp/sudoers':
    source => "puppet:///modules/${module_name}/sudoers",
    owner  => 'root',
    group  => 'root',
    mode   => '0400',
    notify => Exec["visudo check"],
  }

  exec { "visudo check":
    command     => "visudo -c -f /tmp/sudoers",
    unless      => "diff /tmp/sudoers /etc/sudoers",
    path        => "/usr/bin:/usr/sbin"
  }

  file { '/etc/sudoers':
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    source  => "puppet:///modules/${module_name}/sudoers",
    require => Exec["visudo check"]
  }
}
