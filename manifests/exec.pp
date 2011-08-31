exec { 'touch /tmp/foo':
  creates => '/tmp/foo',
  path    => '/bin',
}

file { "/tmp/foo":
  ensure  => absent,
}
