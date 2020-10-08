# Provider
#--------------------------------------------------------#
data "azurerm_client_config" "current" {
  version= ">=2.2.0"
  features {}
}

# Resource Group
#--------------------------------------------------------#
resource "azurerm_resource_group" "rg" {
  name     = "ScSc-KVTEST01-rg"
  location = "canadacentral"
}

# KeyVault
#--------------------------------------------------------#
resource "azurerm_key_vault" "kv" {
  name                        = "ScSc-KVTEST01-kv"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled         = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = "standard"
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "get",
    ]
    secret_permissions = [
      "get",
    ]
    storage_permissions = [
      "get",
    ]
  }
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }
}

# Secret
#--------------------------------------------------------#
resource "azurerm_key_vault_secret" "secret" {
  name         = "subscription_id"
  value        = "secretSubscriptionID"
  key_vault_id = azurerm_key_vault.kv.id
}