terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "MadrigalAguirre"
  location = "eastus"
}


resource "azurerm_data_factory" "df" {
  name                = "DataFactoryMadrigalAguirre1018"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location

  github_configuration {
    account_name = "zebek95"
    branch_name = "main"
    git_url = "https://github.com"
    repository_name = "sql-server-on-premise-migration"
    root_folder = "data_factory"
  }

  identity {
    type = "SystemAssigned"
  }
}