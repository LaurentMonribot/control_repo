class profile::base {
  user { 'admin':
    ensure => present,
  }

  file { '/root/README':
    ensure => file,
    content => "Ceci est un readme\nMon adresse ip est ${ipaddress}\nMon nom est:\n${fqdn}\n",
  }
  
  host { 'puppet-client-1':
    name         => 'puppet-client-1,
    ensure       => file,
    host_aliases => 'firstclient'
    ip           => '10.94.69.4'
  }
  
  host { 'puppet-client-2':
    name         => 'puppet-client-2,
    ensure       => file,
    host_aliases => 'secondclient'
    ip           => '10.94.69.8'
  }
}
