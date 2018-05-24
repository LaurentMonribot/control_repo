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

node /^web/ {
  include role::app_server
}

node mine1 {
  include role::minecraft_role
}
