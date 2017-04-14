# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.synced_folder '../projects', "/projects"

  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'

  config.vm.network :forwarded_port, guest: 80, host: 80
  config.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", disabled: true

  config.vm.provider "virtualbox" do |vb|
    vb.customize [:modifyvm, :id, "--memory", "4096"]
    vb.customize [:modifyvm, :id, "--cpus", "2"]
    vb.customize [:modifyvm, :id, "--ioapic", "on"]
  end

  config.vm.network "public_network", ip: "192.168.1.200"

  config.vm.provision "shell",
    run: "always",
    inline: "route add default gw 192.168.1.1"

  config.vm.provision "shell",
    run: "always",
    inline: "eval `route -n | awk '{ if ($8 ==\"eth0\" && $2 != \"0.0.0.0\") print \"route del default gw \" $2; }'`"

   config.vm.provision :shell, path: "scripts/install.sh"
end
