# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise32"
  config.vm.network "forwarded_port", guest: 80, host: 3002, protocol: 'tcp'

  config.vm.provision "shell",
    path: "init.sh"

  config.vm.provision "file",
    source: 'Config.pm',
    destination: "Config.pm"

  config.vm.provision "shell",
    path: "db.sh"



end
