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
