node default {
  include profile::base
}

node 'puppet' {
  include role::master_server
}

node /^web/ {
  include role::app_server
}
