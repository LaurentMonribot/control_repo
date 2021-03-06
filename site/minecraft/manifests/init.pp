class minecraft (
 $url = 'https://launcher.mojang.com/mc/game/1.12.2/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar',
 $install_dir = '/opt/minecraft'){
  include ::wget
  
  file { "${install_dir}":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode    => '0644',
  }
  
  file { "${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
    owner  => 'root',
    group  => 'root',
    mode    => '0644',
  }
  
  file { '/etc/systemd/system/minecraft.service':
      ensure => file,
      #content => "[Unit]\nDescription=Minecraft server\nAfter=network-online.target\nWants=network.target\nRequires=network-online.target\nConditionPathExists=/opt/minecraft\n[Service]\nWorkingDirectory=/opt/minecraft\nExecStart=/usr/bin/java -Xmx512M -Xms32M -jar server.jar nogui\nRestart=always\nRestartPreventExitStatus=255\nType=notify\n[Install]\nWantedBy=multi-user.target\nAlias=minecraft\n",
      # source  =>  'puppet:///modules/minecraft/minecraft.service', Mettre minecraft.service dans control_repo/site/minecraft/files/
      content  => epp('minecraft/minecraft.service.epp', {
           install_dir => $install_dir
      }),
      owner  => 'root',
      group  => 'root',
      mode    => '0644',
  }
  
  package {'default-jre':
    ensure  =>  present,
  }

  wget::fetch {"${url}":
    timeout     => 15,
    destination => "${install_dir}/",
    before      => Service['minecraft'],
    verbose     => true,
  }
  
  service {'minecraft':
    ensure  =>  running,
    enable  =>  true,
    require => [
      Package['default-jre'],
      File["${install_dir}/eula.txt"],
      File['/etc/systemd/system/minecraft.service']
      ],
  }

}
