#http		80/tcp		www www-http	# WorldWideWeb HTTP
#http		80/udp		www www-http	# HyperText Transfer Protocol
#kerberos	88/tcp		kerberos5 krb5	# Kerberos v5
#kerberos	88/udp		kerberos5 krb5	# Kerberos v5
#supdup		95/tcp
#supdup		95/udp
#hostname	101/tcp		hostnames	# usually from sri-nic
#hostname	101/udp		hostnames	# usually from sri-nic
include services
services::service { 'http':
  port => 80,
  protocols => ['tcp','udp'],
  aliases   => ['www','www-http'],
  comment   => "WorldWideWeb HTTP",
}
services::service { 'kerberos':
  port => 88,
  protocols => ['tcp','udp'],
  aliases   => ['kerberos5','krb5'],
  comment   => "Kerberos v5",
}
services::service { 'supdup':
  port => 95,
  protocols => ['tcp','udp'],
}
