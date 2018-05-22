class profile::base {
  user { 'admin':
    ensure => present,
  }

  file { '/root/README':
      ensure => present,
  }
}
