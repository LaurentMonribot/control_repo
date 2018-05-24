class profile::minecraft_server {
  include ::wget
  
  file { '/opt/minecraft':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode    => '0644',
  }
  
  file { '/opt/minecraft/eula.txt':
    ensure => file,
    content => "eula=true",
    owner  => 'root',
    group  => 'root',
    mode    => '0644',
  }
  
  file { '/etc/systemd/system/minecraft.service':
      ensure => file,
      content => "[Unit]\nDescription=Minecraft server\nAfter=network-online.target\nWants=network.target\nRequires=network-online.target\nConditionPathExists=/opt/minecraft\n[Service]\nWorkingDirectory=/opt/minecraft\nExecStart=/usr/bin/java -Xmx512M -Xms32M -jar server.jar nogui\nRestart=always\nRestartPreventExitStatus=255\nType=notify\n[Install]\nWantedBy=multi-user.target\nAlias=minecraft\n",
      owner  => 'root',
      group  => 'root',
      mode    => '0644',
  }
  
  package {'default-jre':
    ensure  =>  present,
  }

  wget::fetch { 'https://launcher.mojang.com/mc/game/1.12.2/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar':
    destination => '/opt/minecraft/',
    timeout     => 15,
    verbose     => true,
  }
  
  service {'minecraft':
    ensure  =>  running,
    enable  =>  true,
    require => [
      Package['default-jre'],
      File['/opt/minecraft/eula.txt'],
      File['/etc/systemd/system/minecraft.service'],
      File['/opt/minecraft/server/jar'],
    ]
  }

}
