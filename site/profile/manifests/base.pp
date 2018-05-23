class profile::base {
  user { 'admin':
    ensure => present,
  }

  file { '/root/README':
    ensure => file,
    content => "Ceci est un readme\nMon adresse ip est ${ipaddress}\nMon nom est:\n${fqdn}\n",
  }
  
  file_line { 'Append a first client to /etc/hosts':
    path => '/etc/hosts',
    line => '10.94.69.4  puppet-client-1',
  }
  
  file_line { 'Append a second client to /etc/hosts':
    path => '/etc/hosts',
    line => '10.94.69.8  puppet-client-2',
  }
}
