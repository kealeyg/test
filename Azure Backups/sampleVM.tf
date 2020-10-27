# Global Variables
#-----------------------------------------------------------------------------------------#
variable "username" {
    default = "admkealeyg"
}
variable "password" {
    default = "Canada1!"
}
variable "tags" {
    default = {
        env="sandbox"
        costcenter="816231"
        classification="ull"
        owner="jacqueline.morcos@canada.ca"
        contact="Gregory.Kealey@canada.ca"
        deployment="azure-lz-iac-2020-10-26"
    }
}

# Local Variables
#-----------------------------------------------------------------------------------------#
variable "rg-system" {
  default = "ScDc-System_Dev-rg"
}
variable "rg-network" {
  default = "ScDc-Network_Dev-rg"
}
variable "vnet" {
  default = "ScDcCNR-Dev-vnet"
}
variable "snet" {
  default = "ScDcCNR-Dev-FE-snet"
}

# Data
#-----------------------------------------------------------------------------------------#
# Data - RG
#------------------------------------------------------------------#
data "azurerm_resource_group" "rg-system" {
  name     = var.rg-system
  provider = azurerm.ScSc-PBMMCTOSandbox
}
data "azurerm_resource_group" "rg-network" {
  name     = var.rg-network
  provider = azurerm.ScSc-PBMMCTOSandbox
}

# Data - vNet
#------------------------------------------------------------------#
data "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  provider            = azurerm.ScSc-PBMMCTOSandbox
  resource_group_name = data.azurerm_resource_group.rg-network.name
}

# Data - sNet
#------------------------------------------------------------------#
data "azurerm_subnet" "snet" {
  name                 = var.snet
  provider             = azurerm.ScSc-PBMMCTOSandbox
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg-network.name
}

# VM Windows - BKUO - VM
#-----------------------------------------------------------------------------------------#
resource "azurerm_windows_virtual_machine" "winVM" {
    name = join("-", ["ScDcSWD", "BKUP"])
    provider = azurerm.ScSc-PBMMCTOSandbox
    location = "canadaCentral"
    resource_group_name = data.azurerm_resource_group.rg-system.name
    computer_name  = join("-", ["ScDcSWD", "BKUP"])
    admin_username = var.username
    admin_password = var.password
    network_interface_ids = [azurerm_network_interface.nic1.id]
    size = "Standard_DS2_v2"
    enable_automatic_updates = "true"
    provision_vm_agent = "true"
    allow_extension_operations = "true"
    source_image_reference  {
        publisher = "MicrosoftWindowsServer"
        offer = "WindowsServer"
        sku = "2016-Datacenter"
        version = "latest"
    }
    os_disk {
        name = join("-", ["ScDcSWD", "BKUP", "OSdisk1"])
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
    tags = var.tags
}

# VM Windows - BKUP - NIC
#-----------------------------------------------------------------------------------------#
resource "azurerm_network_interface" "nic1" {
  name                          = join("-", ["ScDcSWD", "BKUP", "nic1"])
  provider                      = azurerm.ScSc-PBMMCTOSandbox
  location                      = "canadaCentral"
  resource_group_name           = data.azurerm_resource_group.rg-system.name
  enable_ip_forwarding          = "false"
  enable_accelerated_networking = "false"
  ip_configuration {
    name                          = join("-", ["ScDcSWD", "BKUP", "nic1-config"])
    subnet_id                     = data.azurerm_subnet.snet.id
    private_ip_address = cidrhost(data.azurerm_subnet.snet.address_prefix, 15)
    private_ip_address_allocation = "static"
    primary = "true"
  }
  tags = var.tags
}

# VM Windows - BKUP - assign
#-----------------------------------------------------------------------------------------#
resource "azurerm_backup_protected_vm" "vm1" {
  resource_group_name = data.azurerm_resource_group.rg-system.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  source_vm_id        = azurerm_windows_virtual_machine.winVM.id
  backup_policy_id    = azurerm_backup_policy_vm.backupPolicy.id
  provider = azurerm.ScSc-PBMMCTOSandbox
}

# VM Windows - BKUP - AutoShutdown
#-----------------------------------------------------------------------------------------#
resource "azurerm_dev_test_global_vm_shutdown_schedule" "shutdown_winVM" {
  virtual_machine_id = azurerm_windows_virtual_machine.winVM.id
  provider = azurerm.ScSc-PBMMCTOSandbox
  location = "canadaCentral"
  enabled = true

  daily_recurrence_time = "1700"
  timezone              = "Eastern Standard Time"

  notification_settings {
    enabled         = false
    time_in_minutes = "60"
  }
}