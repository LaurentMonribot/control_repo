class profile::base {
  user { 'admin':
    ensure => present,
  }

  file { '/root/README':
      ensure => file,
      content => "Ceci est un readme\nMon adresse ip est ${ipaddress}\nMon nom est:\n${fqdn}\n",
  }
}
