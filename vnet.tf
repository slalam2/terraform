resource "azurerm_virtual_network" "vnet" {
  name                = "demoVnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.RG.name
  address_space       = ["10.0.0.0/16"]


}