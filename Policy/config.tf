# Get Subscription Data
#-----------------------------------------------------------------------------------------#
variable environment_gk {}
locals {environment_gk = jsondecode(var.environment_gk)}

# Provider - ScSc-PBMMCTOSandbox
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