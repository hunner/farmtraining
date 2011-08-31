notify { "two":
  require => Notify['one'],
}
notify { "one": }
