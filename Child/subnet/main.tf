resource "azurerm_subnet" "subnet" {
  for_each = var.subnet_name

  name                 = each.value.name
  resource_group_name  = var.resources[each.value.rg].name
  virtual_network_name = var.vnet[each.value.vnet].name
  address_prefixes     = each.value.address_prefixes
}