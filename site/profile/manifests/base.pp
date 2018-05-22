class profile::base {
  user { 'admin':
    ensure => present,
  }

  file { '/root/README':
      ensure => file,
      content => 'Bienvenue sur ${fqdn}\n'
  }
}
