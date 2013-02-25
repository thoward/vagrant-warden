Vagrant::Config.run do |config|
  bit = ['a'].pack('P').length > 4 ? 64 : 32

  config.vm.box = "precise#{bit}"
  config.vm.box_url = "http://files.vagrantup.com/#{config.vm.box}.box"
end
