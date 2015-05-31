# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'chef-goiardi-berkshelf'
  config.vm.box = 'chef/ubuntu-14.04'
  config.vm.network :private_network, type: 'dhcp'

  if Vagrant.has_plugin?('vagrant-omnibus')
    config.omnibus.chef_version = 'latest'
  end

  config.berkshelf.enabled = true

  config.vm.provision :shell, inline: 'sudo apt-get update'
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      goiardi: {
        use_mysql: false
      }
    }

    chef.run_list = [
      'recipe[goiardi::default]',
      'recipe[goiardi::webui]'
    ]
  end
end
