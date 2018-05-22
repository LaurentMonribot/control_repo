node default {
  include profile::base
}

node 'puppet' {
  include role::master_server
}

node /^puppet-client/ {
  user { 'bibi':
    ensure => present,
  }
  include role::client_role
}
