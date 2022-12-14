# automatically add terraform-libvirt plugin from terraform.io
terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

# ensure qemu is running first
provider "libvirt" {
  uri = "qemu:///system"
}

# create infrastructure modules
module "network_1" {
  source = "./modules/virtual-network"
}

module "app_1" {
  source = "./modules/virtual-machine"
  vm_name = "app_1"
  net_name = "network_1"
  mac_addr = "52:54:00:6c:3c:02" 
  cloudinit_path = "${path.module}/scripts/local-ansible-testbench.yml"
}

module "app_2" {
  source = "./modules/virtual-machine"
  vm_name = "app_2"
  net_name = "network_1"
  mac_addr = "52:54:00:6c:3c:03" 
  cloudinit_path = "${path.module}/scripts/local-ansible-testbench.yml"
}

module "db_1" {
  source = "./modules/virtual-machine"
  vm_name = "db_1"
  net_name = "network_1"
  mac_addr = "52:54:00:6c:3c:04" 
  cloudinit_path = "${path.module}/scripts/local-ansible-testbench.yml"
}

# module "testbench_1" {
#   source = "./modules/virtual-machine"
#   # set variables for module
#   vm_name = "testbench_1"
#   net_name = "network_1"
#   mac_addr = "52:54:00:6c:3c:02" 
#   cloudinit_path = "${path.module}/cloud_init_test.cfg"
# }

# module "loadbalancer_1" {
#   source = "./modules/virtual-machine"
#   # set variables for module
#   vm_name = "loadbalancer_1"
#   net_name = "network_1"
#   mac_addr = "52:54:00:6c:3c:02"
#   cloudinit_path = "${path.module}/cloud_init_lb.cfg"
# }

# module "node_1" {
#   source = "./modules/virtual-machine"
#   # set variables for module
#   vm_name = "node_1"
#   net_name = "network_1"
#   mac_addr = "52:54:00:6c:3c:03"
#   cloudinit_path = "${path.module}/cloud_init_vm.cfg"
# }

# module "node_2" {
#   source = "./modules/virtual-machine"
#   # set variables for module
#   vm_name = "node_2"
#   net_name = "network_1"
#   mac_addr = "52:54:00:6c:3c:04"
#   cloudinit_path = "${path.module}/cloud_init_vm.cfg"
# }


