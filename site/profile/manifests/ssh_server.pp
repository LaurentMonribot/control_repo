class profile::ssh_server {
  package { 'openssh-server':
    ensure => present,
  }
  
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  
  user { 'root':
    ensure         => present,
    home           => '/root',
    uid            => '0',
    purge_ssh_keys => true,
  }
    
  ssh_authorized_key { 'root@${ipaddress}':
    ensure => 'present',
    user   => 'root',
    type   => 'ssh-rsa',
    key    => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCdTolN2KnDevbsxsS61ptHGv2/XVpT3gNLc4ag4PkagMgyBl47WjLxhf9qHxCFfF6oV7uvILbeNIX07etBe69WBxbYOQqNFUlKeHpYzzQ3k6cmXWluJ7Gl0Z/liAPI6j5X8QS38Ej6ipRHG+2TLyPeQYMtVOU+SEz875vTRj5ui0/xk59uP/ZhZKTOaHHyBiOhrBno0F0RxSTgPkh5ju5qbbHF8Oaiu5kdRT9Ok6s3uyq2rBfJKOB/MDdjonNTHo9fp9HpiwWIGej3VJwPCCOwtYXz6UcAEiU24lbbDKMDg1BnFNQ/M2/IRdT234uqSdeCAFWDkR1me3V8fFPK/DQ7"
  }
}
