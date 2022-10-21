# Configure the Azure provider
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}


# Set minimum Terraform version and Terraform Cloud backend
terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = ">= 3"
  }
}
