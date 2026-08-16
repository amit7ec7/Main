resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsg_name
  name                = each.value.name
  location            = var.resources[each.value.rg].location
  resource_group_name = var.resources[each.value.rg].name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  for_each = var.nsg_name

  subnet_id                 = var.subnets[each.value.subnet].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}
