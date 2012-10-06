class warden($user, $rvm='ruby-1.9.3-p194') {

  if ! defined(Package['debootstrap']) { package { 'debootstrap': ensure => installed } }
  if ! defined(Package['quota']) {       package { 'quota':       ensure => installed } }

  include 'rvm'

  rvm::system_user { $user:
    require => Class['rvm'],
  }

  rvm_system_ruby { $rvm:
    ensure  => 'present',
    require => Rvm::System_user[$user],
  }

  $root = '/opt/warden'
  $run = '/usr/sbin/warden-run'
  $setup = '/usr/sbin/warden-setup'
  $reset = '/usr/sbin/warden-reset'
  $repl = '/usr/sbin/warden-repl'
  $server = '/usr/sbin/warden-server'

  file { 'warden-run':
    ensure  => present,
    path    => $run,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('warden/run.erb'),
    require => Rvm_system_ruby[$rvm],
  }

  file { 'warden-setup':
    ensure  => present,
    path    => $setup,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('warden/setup.erb'),
    require => File['warden-run'],
  }

  file { 'warden-reset':
    ensure  => present,
    path    => $reset,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('warden/reset.erb'),
    require => File['warden-run'],
  }

  file { 'warden-server':
    ensure  => present,
    path    => $server,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('warden/server.erb'),
    require => File['warden-run'],
  }

  file { $repl:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('warden/repl.erb'),
    require => File['warden-run'],
  }
}
