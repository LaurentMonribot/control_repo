class profile::ssh_server {
  package { 'openssh-server':
    ensure => present,
  }
  
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
}
