resource "azurerm_network_interface" "nic" {
  for_each = var.nic_name

  name                = each.value.name
  location            = var.resources[each.value.rg].location
  resource_group_name = var.resources[each.value.rg].name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet[each.value.subnet].id
    private_ip_address_allocation = "Dynamic"
  }
}
