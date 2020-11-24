/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-CosmosDB" {
    name = "TF - Deny-PublicEndpoint-CosmosDB - GK"
    policy_type = "Custom"
    mode = "All"
    display_name = "TF - Deny-PublicEndpoint-CosmosDB - GK"
    provider = azurerm.ScSc-PBMMCTOSandbox
    metadata = <<METADATA
    {
        "category": "Greg Test"
    }
    METADATA
    policy_rule = <<POLICY_RULE
    {
        "if": {
            "allOf": [{
                "field": "type",
                "equals": "Microsoft.DocumentDB/databaseAccounts"
            },{
                "field": "Microsoft.DocumentDB/databaseAccounts/publicNetworkAccess",
                "notequals": "Disabled"
            }]
        },
        "then": {
            "effect": "Deny"
        }
    }
    POLICY_RULE
    parameters = <<PARAMETERS
    {}
    PARAMETERS
}

/* Policy Assignment
-----------------------------------------------------*/
resource "azurerm_policy_assignment" "policy-assignment_Deny-PublicEndpoint-CosmosDB" {
  name = "TF - Deny-PublicEndpoint-CosmosDB - GK"
  provider = azurerm.ScSc-PBMMCTOSandbox
  scope = "/subscriptions/f3c68f92-f832-4632-82d5-c6c7a9e37e08/"
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-CosmosDB.id
  description = "This policy restrict creation of cosmos db accounts with exposed public endpoints"
  display_name = "TF - Deny-PublicEndpoint-CosmosDB - GK"
}

/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-MariaDB" {
    name = "TF - Deny-PublicEndpoint-MariaDB - GK"
    policy_type = "Custom"
    mode = "All"
    display_name = "TF - Deny-PublicEndpoint-MariaDB - GK"
    provider = azurerm.ScSc-PBMMCTOSandbox
    metadata = <<METADATA
    {
        "category": "Greg Test"
    }
    METADATA
    policy_rule = <<POLICY_RULE
    {
        "if": {
            "allOf": [{
                "field": "type",
                "equals": "Microsoft.DBforMariaDB/servers"
            },{
                "field": "Microsoft.DBforMariaDB/servers/publicNetworkAccess",
                "notequals": "Disabled"
            }]
        },
        "then": {
            "effect": "Deny"
        }
    }
    POLICY_RULE
    parameters = <<PARAMETERS
    {}
    PARAMETERS
}

/* Policy Assignment
-----------------------------------------------------*/
resource "azurerm_policy_assignment" "policy-assignment_Deny-PublicEndpoint-MariaDB" {
  name = "TF - Deny-PublicEndpoint-MariaDB - GK"
  provider = azurerm.ScSc-PBMMCTOSandbox
  scope = "/subscriptions/f3c68f92-f832-4632-82d5-c6c7a9e37e08/"
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-MariaDB.id
  description = "This policy restrict creation of Maria DB accounts with exposed public endpoints"
  display_name = "TF - Deny-PublicEndpoint-MariaDB - GK"
}

/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-MySQL" {
    name = "TF - Deny-PublicEndpoint-MySQL - GK"
    policy_type = "Custom"
    mode = "All"
    display_name = "TF - Deny-PublicEndpoint-MySQL - GK"
    provider = azurerm.ScSc-PBMMCTOSandbox
    metadata = <<METADATA
    {
        "category": "Greg Test"
    }
    METADATA
    policy_rule = <<POLICY_RULE
    {
        "if": {
            "allOf": [{
                "field": "type",
                "equals": "Microsoft.DBforMySQL/servers"
            },{
                "field": "Microsoft.DBforMySQL/servers/publicNetworkAccess",
                "notequals": "Disabled"
            }]
        },
        "then": {
            "effect": "Deny"
        }
    }
    POLICY_RULE
    parameters = <<PARAMETERS
    {}
    PARAMETERS
}

/* Policy Assignment
-----------------------------------------------------*/
resource "azurerm_policy_assignment" "policy-assignment_Deny-PublicEndpoint-MySQL" {
  name = "TF - Deny-PublicEndpoint-MySQL - GK"
  provider = azurerm.ScSc-PBMMCTOSandbox
  scope = "/subscriptions/f3c68f92-f832-4632-82d5-c6c7a9e37e08/"
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-MySQL.id
  description = "This policy restrict creation of MySql DB accounts with exposed public endpoints"
  display_name = "TF - Deny-PublicEndpoint-MySQL - GK"
}

/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-PostgreSql" {
    name = "TF - Deny-PublicEndpoint-PostgreSql - GK"
    policy_type = "Custom"
    mode = "All"
    display_name = "TF - Deny-PublicEndpoint-PostgreSql - GK"
    provider = azurerm.ScSc-PBMMCTOSandbox
    metadata = <<METADATA
    {
        "category": "Greg Test"
    }
    METADATA
    policy_rule = <<POLICY_RULE
    {
        "if": {
            "allOf": [{
                "field": "type",
                "equals": "Microsoft.DBforPostgreSQL/servers"
            },{
                "field": "Microsoft.DBforPostgreSQL/servers/publicNetworkAccess",
                "notequals": "Disabled"
            }]
        },
        "then": {
            "effect": "Deny"
        }
    }
    POLICY_RULE
    parameters = <<PARAMETERS
    {}
    PARAMETERS
}

/* Policy Assignment
-----------------------------------------------------*/
resource "azurerm_policy_assignment" "policy-assignment_Deny-PublicEndpoint-PostgreSql" {
  name = "TF - Deny-PublicEndpoint-PostgreSql - GK"
  provider = azurerm.ScSc-PBMMCTOSandbox
  scope = "/subscriptions/f3c68f92-f832-4632-82d5-c6c7a9e37e08/"
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-PostgreSql.id
  description = "This policy restrict creation of Postgre SQL DB accounts with exposed public endpoints."
  display_name = "TF - Deny-PublicEndpoint-PostgreSql - GK"
}

/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-KeyVault" {
    name = "TF - Deny-PublicEndpoint-KeyVault - GK"
    policy_type = "Custom"
    mode = "All"
    display_name = "TF - Deny-PublicEndpoint-KeyVault - GK"
    provider = azurerm.ScSc-PBMMCTOSandbox
    metadata = <<METADATA
    {
        "category": "Greg Test"
    }
    METADATA
    policy_rule = <<POLICY_RULE
    {
        "if": {
            "allOf": [{
                "field": "type",
                "equals": "Microsoft.KeyVault/vaults"
            },{
                "field": "Microsoft.KeyVault/vaults/networkAcls.defaultAction",
                "notequals": "Deny"
            }]
        },
        "then": {
            "effect": "Deny"
        }
    }
    POLICY_RULE
    parameters = <<PARAMETERS
    {}
    PARAMETERS
}

/* Policy Assignment
-----------------------------------------------------*/
resource "azurerm_policy_assignment" "policy-assignment_Deny-PublicEndpoint-KeyVault" {
  name = "TF - Deny-PublicEndpoint-KeyVault - GK"
  provider = azurerm.ScSc-PBMMCTOSandbox
  scope = "/subscriptions/f3c68f92-f832-4632-82d5-c6c7a9e37e08/"
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-KeyVault.id
  description = "This policy restrict creation of Key Vaults with IP Firewall exposed to all public endpoints"
  display_name = "TF - Deny-PublicEndpoint-KeyVault - GK"
}

/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-Sql" {
    name = "TF - Deny-PublicEndpoint-Sql - GK"
    policy_type = "Custom"
    mode = "All"
    display_name = "TF - Deny-PublicEndpoint-Sql - GK"
    provider = azurerm.ScSc-PBMMCTOSandbox
    metadata = <<METADATA
    {
        "category": "Greg Test"
    }
    METADATA
    policy_rule = <<POLICY_RULE
    {
        "if": {
            "allOf": [{
                "field": "type",
                "equals": "Microsoft.Sql/servers"
            },{
                "field": "Microsoft.Sql/servers/publicNetworkAccess",
                "notequals": "Disabled"
            }]
        },
        "then": {
            "effect": "Deny"
        }
    }
    POLICY_RULE
    parameters = <<PARAMETERS
    {}
    PARAMETERS
}

/* Policy Assignment
-----------------------------------------------------*/
resource "azurerm_policy_assignment" "policy-assignment_Deny-PublicEndpoint-Sql" {
  name = "TF - Deny-PublicEndpoint-Sql - GK"
  provider = azurerm.ScSc-PBMMCTOSandbox
  scope = "/subscriptions/f3c68f92-f832-4632-82d5-c6c7a9e37e08/"
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-Sql.id
  description = "This policy restrict creation of Sql servers with exposed public endpoints"
  display_name = "TF - Deny-PublicEndpoint-Sql - GK"
}

/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-Storage" {
    name = "TF - Deny-PublicEndpoint-Storage - GK"
    policy_type = "Custom"
    mode = "All"
    display_name = "TF - Deny-PublicEndpoint-Storage - GK"
    provider = azurerm.ScSc-PBMMCTOSandbox
    metadata = <<METADATA
    {
        "category": "Greg Test"
    }
    METADATA
    policy_rule = <<POLICY_RULE
    {
        "if": {
            "allOf": [{
                "field": "type",
                "equals": "Microsoft.Storage/storageAccounts"
            },{
                "field": "Microsoft.Storage/storageAccounts/networkAcls.defaultAction",
                "notequals": "Deny"
            }]
        },
        "then": {
            "effect": "Deny"
        }
    }
    POLICY_RULE
    parameters = <<PARAMETERS
    {}
    PARAMETERS
}

/* Policy Assignment
-----------------------------------------------------*/
resource "azurerm_policy_assignment" "policy-assignment_Deny-PublicEndpoint-Storage" {
  name = "TF - Deny-PublicEndpoint-Storage - GK"
  provider = azurerm.ScSc-PBMMCTOSandbox
  scope = "/subscriptions/f3c68f92-f832-4632-82d5-c6c7a9e37e08/"
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-Storage.id
  description = "This policy restrict creation of storage accounts with IP Firewall exposed to all public endpoints"
  display_name = "TF - Deny-PublicEndpoint-Storage - GK"
}

/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-Aks" {
    name = "TF - Deny-PublicEndpoint-Aks - GK"
    policy_type = "Custom"
    mode = "All"
    display_name = "TF - Deny-PublicEndpoint-Aks - GK"
    provider = azurerm.ScSc-PBMMCTOSandbox
    metadata = <<METADATA
    {
        "category": "Greg Test"
    }
    METADATA
    policy_rule = <<POLICY_RULE
    {
        "if": {
            "allOf": [{
                "field": "type",
                "equals": "Microsoft.ContainerService/managedClusters"
            },{
                "field": "Microsoft.ContainerService/managedClusters/apiServerAccessProfile.enablePrivateCluster",
                "notequals": "true"
            }]
        },
        "then": {
            "effect": "Deny"
        }
    }
    POLICY_RULE
    parameters = <<PARAMETERS
    {}
    PARAMETERS
}

/* Policy Assignment
-----------------------------------------------------*/
resource "azurerm_policy_assignment" "policy-assignment_Deny-PublicEndpoint-Aks" {
  name = "TF - Deny-PublicEndpoint-Aks - GK"
  provider = azurerm.ScSc-PBMMCTOSandbox
  scope = "/subscriptions/f3c68f92-f832-4632-82d5-c6c7a9e37e08/"
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-Aks.id
  description = "This policy restricts creation of non-private AKS clusters"
  display_name = "TF - Deny-PublicEndpoint-Aks - GK"
}