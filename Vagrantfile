# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.define :master do |master_config|
    master_config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    master_config.vm.box = "precise64"

    master_config.vm.network :hostonly, "192.168.33.10"
    master_config.vm.host_name = "celery"

    master_config.vm.provision :puppet do |puppet|
       puppet.manifests_path = "manifests"
       puppet.manifest_file  = "master.pp"
       puppet.module_path    = "puppet/modules"
    end

  end

  config.vm.define :agent do |agent_config|
    agent_config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    agent_config.vm.box = "precise64"

    agent_config.vm.network :hostonly, "192.168.33.11"
    agent_config.vm.host_name = "lettuce"

    agent_config.vm.provision :puppet do |puppet|
       puppet.manifests_path = "manifests"
       puppet.manifest_file  = "agent.pp"
       puppet.module_path    = "puppet/modules"
    end
  end
end
