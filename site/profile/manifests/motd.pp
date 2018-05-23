class profile::motd {

    file { '/etc/motd':
      ensure => file,
      content => "Bonjour, vous êtes sur la machine ${fqdn}, ip ${ipaddress}\n",
      owner  => 'root',
      group  => 'root',
      mode    => '0644',
      content => "hello, world!\n",
    }
}
