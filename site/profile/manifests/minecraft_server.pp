class profile::minecraft_server {
  include ::wget
  
  file { '/opt/minecraft':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode    => '0644',
  }
  
  file { '/opt/minecraft/minecraft.service':
      ensure => file,
      content => "[Unit]\nDescription=Minecraft server\nAfter=network-online.target\nWants=network.target\nRequires=network-online.target\nConditionPathExists=/opt/minecraft\n[Service]\nWorkingDirectory=/opt/minecraft\nExecStart=/usr/bin/java -Xmx512M -Xms512M -jar server.jar nogui\nExecReload=/bin/kill -HUP $MAINPID\nKillMode=process\nRestart=always\nRestartPreventExitStatus=255\nType=notify\n[Install]\nWantedBy=multi-user.target\nAlias=minecraft\n",
      owner  => 'root',
      group  => 'root',
      mode    => '0644',
  }

  wget::fetch { 'https://launcher.mojang.com/mc/game/1.12.2/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar':
    destination => '/opt/minecraft/',
    timeout     => 15,
    verbose     => true,
  }

}
