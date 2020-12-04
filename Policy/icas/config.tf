# Get Subscription Data
#-----------------------------------------------------------------------------------------#
variable environment_gk {}
locals {environment_gk = jsondecode(var.environment_gk)}

# Provider - ScDc-GCPASS-ICAS-Dev
#-----------------------------------------------------------------------------------------#
provider "azurerm" {
    version= ">=2.2.0"
    alias = "ScSc-PBMMCTOSandbox"
    features {}
    subscription_id = local.environment_gk.0.subscription_id
    client_id = local.environment_gk.0.client_id
    client_secret = local.environment_gk.0.client_secret
    tenant_id = local.environment_gk.0.tenant_id
}

provider "azurerm" {
    version= ">=2.2.0"
    alias = "ScDc-GCPASS-ICAS-Dev"
    features {}
    subscription_id = local.environment_gk.1.subscription_id
    client_id = local.environment_gk.1.client_id
    client_secret = local.environment_gk.1.client_secret
    tenant_id = local.environment_gk.1.tenant_id
}

# Global Variables
#-----------------------------------------------------------------------------------------#
variable scope {default = "/subscriptions/95af4ae7-0c78-42f1-925e-0eb9b0eccf75/"}
variable affix {default = "ICAS"}