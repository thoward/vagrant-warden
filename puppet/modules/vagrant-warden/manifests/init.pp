class vagrant-warden {
  stage { 'vagrant-warden-refresh':
    before => Stage['rvm-install'],
  }

  class { 'vagrant-warden::refresh':
    stage => 'vagrant-warden-refresh',
  }

  class { 'warden':
    user => 'vagrant',
  }
}
