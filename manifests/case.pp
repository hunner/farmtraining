case $operatingsystem {
  'ubuntu': {
    file { "/tmp/ubuntu-os":
      owner  => 'root',
      source => "puppet:///foo/bar/baz",
    }
  }
  'centos': {
    file { "/tmp/os":
      owner   => 'root',
      content => "Real men don't need support contracts\n",
    }
  }
  default: {
    file { "/tmp/os":
      ensure => absent,
    }
  }
}

