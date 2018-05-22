node default {
}

node 'puppet' {
  include role::master_server
}

node /web/ {
  include role::app_server
}
