terraform {
  backend "azurerm" {
    resource_group_name  = "MadrigalAguirre"
    storage_account_name = "sqlserversa2"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
  }
}
