provider "azurerm" {
  features {}

}

resource "azurerm_resource_group" "rg" {
  name     = "demoRG"
  location = var.location
    tags = {
      "Environment" = "test"
      "Owner" = "Pawan"
      
    }

}
