Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/#{config.vm.box}.box"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "apt"    
    chef.add_recipe "build-essential"
    chef.add_recipe "debootstrap"
    chef.add_recipe "warden"
  end
end
