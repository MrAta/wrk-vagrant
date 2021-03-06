# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  
  # Customize the number of cores and amount of memory on the VM:
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "1"
    vb.memory = "512"
  end

  # Setup default packages and configuration files
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y build-essential gcc-multilib emacs htop gdb git libssl-dev libz-dev luarocks
    luarocks install luasocket
    apt-get install -y python3-pip
    python3 -m pip install asyncio
    python3 -m pip install aiohttp
    for i in `ls /home`; do echo 'cd /vagrant' >>/home/${i}/.bashrc; done
    for i in `ls /home`; do curl https://gist.githubusercontent.com/MrAta/0332dbd9de6aed202ae1c517e01eba7b/raw/35cb3d7419e9e5c32dfe99bccff8df647aaade5c/.vimrc  2>/dev/null >/home/${i}/.vimrc; chown ${i}:${i} /home/${i}/.vimrc; done
  SHELL
end
