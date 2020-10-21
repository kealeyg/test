# Pull Library
#-----------------------------------------------------------------------------------------#
module "assets" { source = "../modules/assets/" }

# Varriable
#-----------------------------------------------------------------------------------------#
variable "rg-system" {
  default = "ScDc-System_Dev-rg"
}
variable "rg-network" {
  default = "ScDc-Network_Dev-rg"
}
variable "vnet" {
  default = "ScDcCNR-CTO-vnet"
}
variable "snet" {
  default = "ScDcCNR-CTO-FE-snet"
}
variable "names" {
  default = {
    ad01 = "ADTEST01"
    ad02 = "ADTEST02"
  }
}
variable "DC_name" {}

# Data
#-----------------------------------------------------------------------------------------#
# Data - RG
#------------------------------------------------------------------#
data "azurerm_resource_group" "rg-system" {
  name     = var.rg-system
  provider = azurerm.ScDc-PBMMCTODevelopment
}
data "azurerm_resource_group" "rg-network" {
  name     = var.rg-network
  provider = azurerm.ScDc-PBMMCTODevelopment
}

# Data - vNet
#------------------------------------------------------------------#
data "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  provider            = azurerm.ScDc-PBMMCTODevelopment
  resource_group_name = data.azurerm_resource_group.rg-network.name
}

# Data - sNet
#------------------------------------------------------------------#
data "azurerm_subnet" "snet" {
  name                 = var.snet
  provider             = azurerm.ScDc-PBMMCTODevelopment
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg-network.name
}

# VM Windows - AD01 - VM
#-----------------------------------------------------------------------------------------#
resource "azurerm_windows_virtual_machine" "AD01" {
    name = var.names.ad01
    provider = azurerm.ScDc-PBMMCTODevelopment
    location = "canadaCentral"
    resource_group_name = data.azurerm_resource_group.rg-system.name
    computer_name  = var.names.ad01
    admin_username = module.assets.globals.user
    admin_password = module.assets.globals.password
    network_interface_ids = [azurerm_network_interface.winVM_AD01-nic1.id]
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
        name = join("-", [var.names.ad01, "OSdisk1"])
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
    tags = module.assets.globals.tags
}

# VM Windows - AD01 - NIC
#-----------------------------------------------------------------------------------------#
resource "azurerm_network_interface" "winVM_AD01-nic1" {
  name                          = join("-", [var.names.ad01, "nic1"])
  provider                      = azurerm.ScDc-PBMMCTODevelopment
  location                      = "canadaCentral"
  resource_group_name           = data.azurerm_resource_group.rg-system.name
  enable_ip_forwarding          = "false"
  enable_accelerated_networking = "false"
  ip_configuration {
    name                          = join("-", [var.names.ad01, "nic1-config"])
    subnet_id                     = data.azurerm_subnet.snet.id
    private_ip_address = cidrhost(data.azurerm_subnet.snet.address_prefix, 10)
    private_ip_address_allocation = "static"
    primary = "true"
  }
  tags = module.assets.globals.tags
}

# Deploy Script - AD01 - buildADForest.ps1
#-----------------------------------------------------------------------------------------#
resource "azurerm_virtual_machine_extension" "buildADForest" {
  name = "buildADForest"
  provider = azurerm.ScDc-PBMMCTODevelopment
  virtual_machine_id = azurerm_windows_virtual_machine.AD01.id
  publisher = "Microsoft.Compute"
  type = "CustomScriptExtension"
  type_handler_version = "1.9"
  settings = <<SETTINGS
    {
      "fileUris": ["https://raw.githubusercontent.com/kealeyg/test/master/buildADForest.ps1"]
    }
  SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
    {
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File buildADForest.ps1 ${var.DC_name} ${module.assets.globals.password}"
    }
  PROTECTED_SETTINGS
}

# Notes - Please login once server has rebooted to execute createusers.ps1

# VM Windows - AD01 - Auto-Shutdown
#-----------------------------------------------------------------------------------------#
resource "azurerm_dev_test_global_vm_shutdown_schedule" "shutdown_AD01" {
  virtual_machine_id = azurerm_windows_virtual_machine.AD01.id
  provider = azurerm.ScDc-PBMMCTODevelopment
  location = "canadaCentral"
  enabled = true

  daily_recurrence_time = "1700"
  timezone              = "Eastern Standard Time"

  notification_settings {
    enabled         = false
    time_in_minutes = "60"
  }
}

# VM Windows - AD02 - VM
#-----------------------------------------------------------------------------------------#
resource "azurerm_windows_virtual_machine" "AD02" {
    name = var.names.ad02
    provider = azurerm.ScDc-PBMMCTODevelopment
    location = "canadaCentral"
    resource_group_name = data.azurerm_resource_group.rg-system.name
    computer_name  = var.names.ad02
    admin_username = module.assets.globals.user
    admin_password = module.assets.globals.password
    network_interface_ids = [azurerm_network_interface.winVM_AD02-nic1.id]
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
        name = join("-", [var.names.ad02, "OSdisk1"])
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
    tags = module.assets.globals.tags
}

# VM Windows - AD02 - NIC
#-----------------------------------------------------------------------------------------#
resource "azurerm_network_interface" "winVM_AD02-nic1" {
  name                          = join("-", [var.names.ad02, "nic1"])
  provider                      = azurerm.ScDc-PBMMCTODevelopment
  location                      = "canadaCentral"
  resource_group_name           = data.azurerm_resource_group.rg-system.name
  enable_ip_forwarding          = "false"
  enable_accelerated_networking = "false"
  ip_configuration {
    name                          = join("-", [var.names.ad02, "nic1-config"])
    subnet_id                     = data.azurerm_subnet.snet.id
    private_ip_address = cidrhost(data.azurerm_subnet.snet.address_prefix, 11)
    private_ip_address_allocation = "static"
    primary = "true"
  }
  tags = module.assets.globals.tags
}

# VM Windows - AD02 - Auto-Shutdown
#-----------------------------------------------------------------------------------------#
resource "azurerm_dev_test_global_vm_shutdown_schedule" "shutdown_AD02" {
  virtual_machine_id = azurerm_windows_virtual_machine.AD02.id
  provider = azurerm.ScDc-PBMMCTODevelopment
  location = "canadaCentral"
  enabled = true

  daily_recurrence_time = "1700"
  timezone              = "Eastern Standard Time"

  notification_settings {
    enabled         = false
    time_in_minutes = "60"
  }
}

# Deploy Script - AD02 - buildDC.ps1
#-----------------------------------------------------------------------------------------#
resource "azurerm_virtual_machine_extension" "addDC" {
  name = "addDC"
  provider = azurerm.ScDc-PBMMCTODevelopment
  virtual_machine_id = azurerm_windows_virtual_machine.AD02.id
  publisher = "Microsoft.Compute"
  type = "CustomScriptExtension"
  type_handler_version = "1.9"
  settings = <<SETTINGS
    {
      "fileUris": ["https://raw.githubusercontent.com/kealeyg/test/master/addDC.ps1"]
    }
  SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
    {
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File addDC.ps1 ${var.DC_name} ${module.assets.globals.password} ${module.assets.globals.user}"
    }
  PROTECTED_SETTINGS
}