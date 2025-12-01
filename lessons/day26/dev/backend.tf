terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tf-dev-backend"
    container_name      = "devtfstate"
    key                 = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
}