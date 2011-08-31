file { "/tmp/os":
  content => $operatingsystem ? {
    'ubuntu' => "Cartoon of linux\n",
    'centos' => "No copyright infringement here!\n",
    'rhel'   => "Pay us money to use our logo!\n",
    'gentoo' => "Squeeze that extra 0.2ghz out of your box\n",
    default  => "You forgot to add ${operatingsystem}\n",
  },
  owner   => 'root',
}
