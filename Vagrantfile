# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-15.04"
  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 8443
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 9390, host: 9390
  config.vm.network "forwarded_port", guest: 9391, host: 9391
  config.vm.network "forwarded_port", guest: 9392, host: 9392
  config.vm.network "forwarded_port", guest: 9393, host: 9393
  config.vm.network "forwarded_port", guest: 8500, host: 8500

  config.ssh.forward_agent = true

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbooks/main.yml"
  end

  config.vm.synced_folder "/Users/moonglum/Code", "/home/vagrant/Code"
  config.vm.synced_folder "/Users/moonglum/.gnupg", "/home/vagrant/.gnupg"

  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"] = "8056"
    v.vmx["numvcpus"] = "2"
    # https://github.com/mitchellh/vagrant/issues/2248
    v.vmx["tools.syncTime"] = "TRUE"
    v.vmx["tools.synchronize.restore"] = "TRUE"
  end

end