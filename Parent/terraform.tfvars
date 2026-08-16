rg_name = {
    rg1 = {
        name = "tittu"
        location = "eastus"
    }
    rg2 = {
        name = "tillu"
        location = "centralindia"
    }
    rg3 = {
        name = "pillu"
        location = "centralindia"
    }
    rg4 = {
        name = "sillu"
        location = "centralindia"
    }
}

vnet_name = {
    vnet1 = {
        name = "vnet1"
        rg = "rg1"
        address_space = ["10.0.0.0/16"]
        }
    vnet2 = {
        name = "vnet2"
        rg = "rg2"
        address_space = ["10.1.0.0/16"]
        }
}

nsg_name = {
    nsg1 = {
        name = "nsg1"
        rg = "rg1"
        subnet = "subnet1"
    }
    nsg2 = {
        name = "nsg2"
        rg = "rg2"
         subnet = "subnet2"
    }
}

subnet_name = {
    subnet1 = {
        name = "subnet1"
        address_prefixes = ["10.0.1.0/24"]
        rg = "rg1"
        vnet = "vnet1"
    }
    subnet2 = {
        name = "subnet2"
        address_prefixes = ["10.1.1.0/24"]
        rg = "rg2"
        vnet = "vnet2"
    }
}

nic_name = {
    nic1 = {
        name = "nic1"
        rg = "rg1"
        subnet = "subnet1"
    }
    nic2 = {
        name = "nic2"
        rg = "rg2"
        subnet = "subnet2"
    }
}

vm_name = {
    vm01 = {
        name = "vmamit01"
        rg = "rg1"
        size = "Standard_DC1ds_v3"
        admin_username = "azureadmin"
        admin_password = "P@ssword123!"
        nic = "nic1"
    }
    vm02 = {
        name = "vmamit02"
        rg = "rg2"
        size = "Standard_DC1ds_v3"
        admin_username = "azureadmin"
        admin_password = "P@ssword123!"
        nic = "nic2"
    }
}