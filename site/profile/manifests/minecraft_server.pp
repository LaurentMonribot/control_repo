class profile::minecraft_server {
  include ::wget
  
  file { '/opt/minecraft':
    ensure => directory,
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
