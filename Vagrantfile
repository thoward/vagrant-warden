Vagrant::Config.run do |config|
  bit = ['a'].pack('P').length > 4 ? 64 : 32

  config.vm.box = "precise#{bit}"
  config.vm.box_url = "http://files.vagrantup.com/#{config.vm.box}.box"

  config.vm.provision :puppet do |p| 
    p.manifests_path = 'puppet'
    p.manifest_file = 'node.pp'
    p.module_path = 'puppet/modules'
  end 
end
