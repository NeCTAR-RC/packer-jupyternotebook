Vagrant.configure("2") do |config|

  config.vm.define "jupyternotebook" do |c|
    c.vm.box = "ubuntu/bionic64"
    config.vm.provider "libvirt" do |v, override|
      override.vm.box = "peru/ubuntu-18.04-server-amd64"
    end
    c.vm.provision "ansible" do |ansible|
      ansible.extra_vars = { nectar_test_build: true,
                             ansible_python_interpreter: "/usr/bin/python3" }
      ansible.playbook = "ansible/playbook.yml"
      ansible.become = true
    end
  end

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider :virtualbox do |v|
    v.memory = 2048
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.provider :libvirt do |v|
    v.memory = 2048
    v.cpus = 2
  end

end

# vim:syntax=ruby
