node default {
  include profile::base
}

node 'puppet' {
  include profile::master_server
}
