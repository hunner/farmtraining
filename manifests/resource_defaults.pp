File {
  owner => 'root',
  group => 'root',
  mode  => '0641',
}
file {
  '/tmp/defaults':
    ensure => directory,;
  '/tmp/defaults/hello':
    ensure => file,;
  '/tmp/defaults/goodbye':
    ensure => file,;
}
