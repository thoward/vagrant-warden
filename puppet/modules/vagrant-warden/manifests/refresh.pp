class vagrant-warden::refresh {
  exec { 'vagrant-warden-refresh':
    command => 'apt-get update',
    unless  => 'dpkg -s build-essential',
    path    => $::path,
  }
}
