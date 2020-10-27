# Get Subscription Data
#-----------------------------------------------------------------------------------------#
variable environment {}
locals {environment = jsondecode(var.environment)}

# Provider - ScSc-PBMMCTOSandbox
#-----------------------------------------------------------------------------------------#
provider "azurerm" {
    version= ">=2.2.0"
    alias = "ScSc-PBMMCTOSandbox"
    features {}
    subscription_id = local.environment.0.subscription_id
    client_id = local.environment.0.client_id
    client_secret = local.environment.0.client_secret
    tenant_id = local.environment.0.tenant_id
}

# Provider - ScPc-PBMMCTOProduction
#-----------------------------------------------------------------------------------------#
provider "azurerm" {
    version= ">=2.2.0"
    alias = "ScPc-PBMMCTOProduction"
    features {}
    subscription_id = local.environment.1.subscription_id
    client_id = local.environment.1.client_id
    client_secret = local.environment.1.client_secret
    tenant_id = local.environment.1.tenant_id
}

# Provider - ScPc-PBMMCTOCore
#-----------------------------------------------------------------------------------------#
provider "azurerm" {
    version= ">=2.2.0"
    alias = "ScPc-PBMMCTOCore"
    features {}
    subscription_id = local.environment.2.subscription_id
    client_id = local.environment.2.client_id
    client_secret = local.environment.2.client_secret
    tenant_id = local.environment.2.tenant_id
}

# Provider - ScDc-PBMMCTODevelopment
#-----------------------------------------------------------------------------------------#
provider "azurerm" {
    version= ">=2.2.0"
    alias = "ScDc-PBMMCTODevelopment"
    features {}
    subscription_id = local.environment.3.subscription_id
    client_id = local.environment.3.client_id
    client_secret = local.environment.3.client_secret
    tenant_id = local.environment.3.tenant_id
}

# Provider - ScDc-PBMMCIODevelopment
#-----------------------------------------------------------------------------------------#
provider "azurerm" {
    version= ">=2.2.0"
    alias = "ScDc-PBMMCIODevelopment"
    features {}
    subscription_id = local.environment.4.subscription_id
    client_id = local.environment.4.client_id
    client_secret = local.environment.4.client_secret
    tenant_id = local.environment.4.tenant_id
}

# Provider - ScSc-PBMMCIOSandbox
#-----------------------------------------------------------------------------------------#
provider "azurerm" {
    version= ">=2.2.0"
    alias = "ScSc-PBMMCIOSandbox"
    features {}
    subscription_id = local.environment.5.subscription_id
    client_id = local.environment.5.client_id
    client_secret = local.environment.5.client_secret
    tenant_id = local.environment.5.tenant_id
}

# Provider - ScSc-PBMMCTOCCOESandbox
#-----------------------------------------------------------------------------------------#
provider "azurerm" {
    version= ">=2.2.0"
    alias = "ScSc-PBMMCTOCCOESandbox"
    features {}
    subscription_id = local.environment.6.subscription_id
    client_id = local.environment.6.client_id
    client_secret = local.environment.6.client_secret
    tenant_id = local.environment.6.tenant_id
}

# Provider - LzDc-PBMMCTOLandingZoneBCA
#-----------------------------------------------------------------------------------------#
provider "azurerm" {
    version= ">=2.2.0"
    alias = "LzDc-PBMMCTOLandingZoneBCA"
    features {}
    subscription_id = local.environment.7.subscription_id
    client_id = local.environment.7.client_id
    client_secret = local.environment.7.client_secret
    tenant_id = local.environment.7.tenant_id
}

# Provider - ScDc-PBMMCIOESLZ
#-----------------------------------------------------------------------------------------#
provider "azurerm" {
    version= ">=2.2.0"
    alias = "ScDc-PBMMCIOESLZ"
    features {}
    subscription_id = local.environment.8.subscription_id
    client_id = local.environment.8.client_id
    client_secret = local.environment.8.client_secret
    tenant_id = local.environment.8.tenant_id
}

# Provider - ScDc-PBMMCTOPolicyDesign
#-----------------------------------------------------------------------------------------#
provider "azurerm" {
    version= ">=2.2.0"
    alias = "ScDc-PBMMCTOPolicyDesign"
    features {}
    subscription_id = local.environment.9.subscription_id
    client_id = local.environment.9.client_id
    client_secret = local.environment.9.client_secret
    tenant_id = local.environment.9.tenant_id
}


