module "resource_group" {
    source = "../Child/resource_group"
    rg_name = var.rg_name  
}

module "vnet" {
    source = "../Child/vnet"
    vnet_name = var.vnet_name
    resources = module.resource_group.resources
}

module "subnet" {
    source = "../Child/subnet"
    subnet_name = var.subnet_name
    resources = module.resource_group.resources
    vnet = module.vnet.vnets  
}

module "nsg" {
    source = "../Child/nsg"
    nsg_name = var.nsg_name
    resources = module.resource_group.resources
    subnets = module.subnet.subnets    
}

module "nic" {
    source = "../Child/nic"
    nic_name = var.nic_name
    resources = module.resource_group.resources
    subnet = module.subnet.subnets 
}

module "vm" {
    source = "../Child/vm"
    vm_name = var.vm_name
    resources = module.resource_group.resources
    nics = module.nic.nics  
}