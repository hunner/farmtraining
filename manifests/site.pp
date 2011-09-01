node king {
  $cryptedstring = mycrypt("given some string")
  notify { "Crypted string is ${cryptedstring}": }

  $array = ['one','two','three']
  $joined = join($array, ' ')
  notify { "Joined string is $joined": }

  $content = $operatingsystem ? {
    'ubuntu' => "Cartoon of linux",
    'centos' => "No copyright infringement here!",
    'rhel'   => "Pay us money to use our logo!",
    'gentoo' => "Squeeze that extra 0.2ghz out of your box",
    default  => "You forgot to add ${operatingsystem}",
  }

  file { "/tmp/os":
    owner   => 'root',
    content => "${content}\n",
  }

  include motd
  include sudoers
  include ssh
  include bluetooth
}
