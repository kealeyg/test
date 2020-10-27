# Create Storage Account
#-----------------------------------------------------------------------------------------#
resource "azurerm_storage_account" "storageAccount" {
  name = "scdccsabkupstg"
  provider = azurerm.ScSc-PBMMCTOSandbox
  location = "canadaCentral"
  resource_group_name      = data.azurerm_resource_group.rg-system.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = var.tags
}

# Create Recovery Vault
#-----------------------------------------------------------------------------------------#
resource "azurerm_recovery_services_vault" "vault" {
  name = "ScDcCSA-BKUP-vlt"
  provider = azurerm.ScSc-PBMMCTOSandbox
  location = "canadaCentral"
  resource_group_name = data.azurerm_resource_group.rg-system.name
  sku = "Standard"
  tags = var.tags
}

# Register Vault 
#-----------------------------------------------------------------------------------------#
resource "azurerm_backup_container_storage_account" "container" {
  provider = azurerm.ScSc-PBMMCTOSandbox
  resource_group_name = data.azurerm_resource_group.rg-system.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  storage_account_id  = azurerm_storage_account.storageAccount.id
}

# Get Subscription Data
#-----------------------------------------------------------------------------------------#
resource "azurerm_backup_policy_vm" "backupPolicy" {
  name = "ScDcCLD-BKUP-po"
  provider = azurerm.ScSc-PBMMCTOSandbox
  resource_group_name = data.azurerm_resource_group.rg-system.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  timezone = "UTC"
  backup {
    frequency = "Daily"
    time      = "13:00"
  }
  retention_daily {
    count = 10
  }
  retention_weekly {
    count    = 42
    weekdays = ["Sunday", "Wednesday", "Friday", "Saturday"]
  }
  retention_monthly {
    count    = 7
    weekdays = ["Sunday", "Wednesday"]
    weeks    = ["First", "Last"]
  }
  retention_yearly {
    count    = 77
    weekdays = ["Sunday"]
    weeks    = ["Last"]
    months   = ["January"]
  }
  tags = var.tags
}
