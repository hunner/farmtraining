class motd {
  $role = "motd_server"
  file { '/etc/motd':
    ensure  => present,
    content => template("motd/motd.erb")
  }
}
