# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.box = "olegbox"
	config.vm.hostname = "olegbox"
	
	# Export Port 3458
	config.vm.network "forwarded_port", guest: 3458, host: 3458
end
