# Packer Jupyter Notebook image

This project includes scripts to build an Jupyter Notebook image suitable for
the NeCTAR Research Cloud environment.

This image is based on Nectar's official Ubuntu 18.04 (Bionic) image.

We have:
 * Packer JSON config for building the image on the NeCTAR Research Cloud.
 * Ansible roles for provisioning Jupyter Notebook and required environment.
 * Vagrant config for building and testing the image build process locally.

## Requirements

You'll require the following tools installed and in your path
 * Packer
 * Ansible
 * Vagrant and VirtualBox (optional, for testing)
 * OpenStack CLI
 * jq (JSON CLI tool)
 * QEMU tools (for image shrinking process)

## Building the image

 1. Make sure all the required software (listed above) is installed
 1. Load your NeCTAR RC credentials into your environment
 1. cd to the directory containing this README.md file
 1. The build script
```
./build_local.sh
```

## Testing the image with Vagrant

We include a Vagrantfile which can be used for testing the provisioning
process with Ansible and test the resulting image.

```
$ vagrant up
```
Once the build process is completed, Jupyter Notebook should be accessible at
  http://localhost:8080
(which is redirected to port 80 on the VM).
