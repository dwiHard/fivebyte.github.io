## Apa itu Vagrant?
Vagrant adalah sebuah perangkat lunak sumber terbuka (open-source) yang berfungsi untuk membangun dan mengelola lingkungan pengembangan virtual. Dengan Vagrant, developer dapat membuat lingkungan yang konsisten dan dapat direproduksi untuk proyek mereka, terlepas dari sistem operasi yang mereka gunakan.

## Install Boxes

untuk melihat boxes bisa cek di link ini https://app.vagrantup.com/boxes/search

```sh
vagrant init ubuntu/focal64
```

## Config Vagrant
### Server Ubuntu

Contoh config ubuntu focal dengan 3 server

```bash
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/focal64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
vb.cpus = 2
vb.memory = "2048"
vb.linked_clone = true
end
  #
  # View the documentation for the provider you are using for more
  # information on available options.
config.vm.define "server1" do |server1|
    server1.vm.network :private_network, ip: "192.168.56.1"
end
config.vm.define "server2" do |server2|
    server2.vm.network :private_network, ip: "192.168.56.2"
end
config.vm.define "server3" do |server3|
    server3.vm.network :private_network, ip: "192.168.56.3"
end
  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
  SHELL
end
```

## Service Vagrant

menjalankan server 

```sh
vagrant up
```

mematikan/shutdown server 

```sh
vagrant halt
```

melihat status

```sh
vagrant status
```

menghubungan server dengan ssh

```sh
vagrant ssh nameServer
```



## Terima Kasih
