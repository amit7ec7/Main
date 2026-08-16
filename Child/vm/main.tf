resource "azurerm_windows_virtual_machine" "vm" {
  for_each = var.vm_name

  name                = each.value.name
  location            = var.resources[each.value.rg].location
  resource_group_name = var.resources[each.value.rg].name
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password

  network_interface_ids = [var.nics[each.value.nic].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}
