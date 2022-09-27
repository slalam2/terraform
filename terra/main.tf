provider "azurerm" {
  features {}

}

resource "azurerm_resource_group" "rg" {
  name     = "demoRG"
  location = "eastus"
    tags = {
      "Environment" = "test"
      "Owner" = "Pawan"
      
    }

}

resource "azurerm_storage_account" "storage" {
  name                     = "dialogstorage1"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"


}
