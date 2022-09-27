resource "azurerm_virtual_machine" "VM" {
for_each                         = toset(var.vm_name)
  name                             = each.value
  location                         = var.location
  resource_group_name              = azurerm_resource_group.rg.name
  network_interface_ids            = [azurerm_network_interface.nic[each.key].id]
  vm_size                          = "Standard_D8s_V3"
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.7"
    version   = "Latest"

  }
  storage_os_disk {
    name              = "${each.key}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
    disk_size_gb      = "32"
  }

  storage_data_disk {
    name              = "${each.key}-disk1"
    caching           = "none"
    create_option     = "Empty"
    disk_size_gb      = 512
    lun               = 0
    managed_disk_type = "Premium_LRS"


  }
  os_profile {
    computer_name  = each.value
    admin_username = "${each.key}-adm"
    admin_password = "Welcome@2022!"

  }

  os_profile_linux_config {
    disable_password_authentication = false

  }
  

  boot_diagnostics {
    enabled     = "true"
    storage_uri = azurerm_storage_account.storage.primary_blob_endpoint

  }




}