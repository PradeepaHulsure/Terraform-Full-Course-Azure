terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tf-stage-backend"
    container_name      = "stgtfstate"
    key                 = "stage.tfstate"
  }
}

provider "azurerm" {
  features {}
}