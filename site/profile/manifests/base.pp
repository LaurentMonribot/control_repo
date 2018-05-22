class profile::base {
  user { 'admin':
    ensure => present,
  }

  file { '/root/README':
      ensure => present,
      content => "Ceci est un readme\nMon adresse ip est ${ipaddress}\nMon nom est:\n${fdqn}\n",
  }
}
