define usermanagement::manage(
    $ensure,
    $homedir="default",
    $group="/default/",
    $shell='/bin/bash'
  ) {

  if $name == 'root' {
    fail("Can't manage root")
  }

  if $homedir == "default" {
    $homedir_real = "/home/${name}"
  } else {
    $homedir_real = $homedir
  }
  if $group == "/default/" {
    $gid = $name
  } else {
    $gid = $group
  }
  if $ensure == "present" {
    file { $homedir_real:
      ensure => directory,
      owner  => $name,
      group  => $gid,
    }
  } else {
    file { $homedir_real:
      ensure => directory,
      owner  => 'root',
      group  => 'root',
    }
  }

  user { $name:
    ensure => $ensure,
    home   => $homedir_real,
    gid    => $gid,
    shell  => $shell,
  }

  if $ensure == "present" {
    if ! defined(Group[$gid]) {
      group { $gid:
        ensure => present,
      }
    }
  }
}
