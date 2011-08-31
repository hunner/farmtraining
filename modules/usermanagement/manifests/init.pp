class usermanagement {
  $home_base = '/home'
  file { $home_base:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
}
