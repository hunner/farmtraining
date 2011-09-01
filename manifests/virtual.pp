class users {
  @user { 'elvis':
    ensure => present,
    group  => ['dev','users'],
  }
  @user { 'quux':
    group => ['dev','users'],
  }
  @user { 'hunner':
    group => ['wheel','root','dev','users'],
  }
  @user { 'batesn':
    group => ['users'],
  }
}

class dev_server {
  User <| group == 'wheel' |>
  User <| group == 'dev' |>
}

define realize_groups {
  User <| group == $name |>
  User <| gid == $name |>
}

class bastion_host {
  realize_groups { "wheel": }
}

class normal_server {
  User <| group == 'wheel' |>
  User <| group == 'users' |>
}

node foo {
  include users
  include normal_server
  include dev_server
  Package <| ensure == 'present' |> -> Service <| ensure == 'running' |>
  Package['openssh-server'] -> Service['sshd']
}
