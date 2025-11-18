# Vagrantfile
Vagrant.configure("2") do |config|
  # CAMBIO AQUÍ: Usamos Ubuntu 22.04 (Jammy)
  config.vm.box = "ubuntu/jammy64" 
  config.vm.network "private_network", ip: "192.168.56.10"
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end
end