node default {
  include profile::base
}

node 'puppet' {
  include role::master_server
}
