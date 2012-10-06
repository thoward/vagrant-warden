class { 'vagrant-warden': }

exec { 'warden':
  command => 'warden-setup',
  unless  => 'test -d /opt/warden',
  require => File['warden-setup'],
  path    => $::path,
}
