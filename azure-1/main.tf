# Main

# Create a random id
resource "random_id" "buildSuffix" {
  byte_length = 2
}

# Create a Resource Group
resource "azurerm_resource_group" "main" {
  name     = format("%s-rg-%s", var.projectPrefix, random_id.buildSuffix.hex)
  location = var.location
  tags = {
    owner = var.resourceOwner
  }
}

# Key vault
resource "azurerm_key_vault" "main" {
  name     = format("%s-kv-%s", var.projectPrefix, random_id.buildSuffix.hex)
  location                    = azurerm_resource_group.main.location
  resource_group_name         = azurerm_resource_group.main.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "List",
      "Create",
      "Delete",
      "Update",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
    ]

    storage_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Update",
    ]
  }
}

resource "azurerm_user_assigned_identity" "main" {
  location            = azurerm_resource_group.main.location
  name                = "bigipmanage"
  resource_group_name = azurerm_resource_group.main.name
}