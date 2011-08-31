#$username = "root"
$username = "elvis"

$sourcedir = "/etc/puppetlabs/puppet/files"
#$sourcedir = "puppet://puppetserver.foo.com/modules/myenv"

File {
  owner => $username,
  group => $username,
  mode  => '0644',
}

$homedir = $username ? {
  'root'  => '/root',
  default => "/home/${username}",
}

file { "${homedir}/.vimrc":
  source => "${sourcedir}/vimrc",
}

file { "${homedir}/.vim":
  recurse => true,
  source  => "${sourcedir}/vim",
}

if $username == "root" {
  file { "${homedir}/.ssh/authorized_keys":
    ensure => absent,
  }
} else {
  file { "${homedir}/.ssh":
    ensure => directory,
    mode   => '0700',
  }
  file { "${homedir}/.ssh/authorized_keys":
    ensure => present,
    source => "${sourcedir}/authorized_keys.$username",
  }
}
