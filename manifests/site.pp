node default {
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
}
