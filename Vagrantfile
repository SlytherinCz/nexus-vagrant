# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

  if File.exist?("vagrant.yml")
    settings = YAML.load_file 'vagrant.yml'
  else
    settings = YAML.load_file 'vagrant.yml.dist'
  end

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.network "forwarded_port", guest: 8081, host: settings["host_port"]

  config.vm.synced_folder "./", "/home/vagrant/shared/"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = settings["memory"]
    vb.cpus = settings["cpus"]
  end

  config.vm.provision "shell", path: "provision.sh"
end
