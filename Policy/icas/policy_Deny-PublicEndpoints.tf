/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-CosmosDB" {
    name = join(" - ", ["TF - Deny-PublicEndpoint-CosmosDB", var.affix])
    policy_type = "Custom"
    mode = "All"
    display_name = join(" - ", ["TF - Deny-PublicEndpoint-CosmosDB", var.affix])
    provider = azurerm.ScDc-GCPASS-ICAS-Dev
    metadata = <<METADATA
    {
        "category": "TF Deny Policies"
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
  name = join(" - ", ["TF - Deny-PublicEndpoint-CosmosDB", var.affix])
  provider = azurerm.ScDc-GCPASS-ICAS-Dev
  scope = var.scope
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-CosmosDB.id
  description = "This policy restrict creation of cosmos db accounts with exposed public endpoints"
  display_name = join(" - ", ["TF - Deny-PublicEndpoint-CosmosDB", var.affix])
}

/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-MariaDB" {
    name = join(" - ", ["TF - Deny-PublicEndpoint-MariaDB", var.affix])
    policy_type = "Custom"
    mode = "All"
    display_name = join(" - ", ["TF - Deny-PublicEndpoint-MariaDB", var.affix])
    provider = azurerm.ScDc-GCPASS-ICAS-Dev
    metadata = <<METADATA
    {
        "category": "TF Deny Policies"
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
  name = join(" - ", ["TF - Deny-PublicEndpoint-MariaDB", var.affix])
  provider = azurerm.ScDc-GCPASS-ICAS-Dev
  scope = var.scope
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-MariaDB.id
  description = "This policy restrict creation of Maria DB accounts with exposed public endpoints"
  display_name = join(" - ", ["TF - Deny-PublicEndpoint-MariaDB", var.affix])
}

/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-MySQL" {
    name = join(" - ", ["TF - Deny-PublicEndpoint-MySQL", var.affix])
    policy_type = "Custom"
    mode = "All"
    display_name = join(" - ", ["TF - Deny-PublicEndpoint-MySQL", var.affix])
    provider = azurerm.ScDc-GCPASS-ICAS-Dev
    metadata = <<METADATA
    {
        "category": "TF Deny Policies"
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
  name = join(" - ", ["TF - Deny-PublicEndpoint-MySQL", var.affix])
  provider = azurerm.ScDc-GCPASS-ICAS-Dev
  scope = var.scope
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-MySQL.id
  description = "This policy restrict creation of MySql DB accounts with exposed public endpoints"
  display_name = join(" - ", ["TF - Deny-PublicEndpoint-MySQL", var.affix])
}

/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-PostgreSql" {
    name = join(" - ", ["TF - Deny-PublicEndpoint-PostgreSql", var.affix])
    policy_type = "Custom"
    mode = "All"
    display_name = join(" - ", ["TF - Deny-PublicEndpoint-PostgreSql", var.affix])
    provider = azurerm.ScDc-GCPASS-ICAS-Dev
    metadata = <<METADATA
    {
        "category": "TF Deny Policies"
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
  name = join(" - ", ["TF - Deny-PublicEndpoint-PostgreSql", var.affix])
  provider = azurerm.ScDc-GCPASS-ICAS-Dev
  scope = var.scope
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-PostgreSql.id
  description = "This policy restrict creation of Postgre SQL DB accounts with exposed public endpoints."
  display_name = join(" - ", ["TF - Deny-PublicEndpoint-PostgreSql", var.affix])
}

/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-KeyVault" {
    name = join(" - ", ["TF - Deny-PublicEndpoint-KeyVault", var.affix])
    policy_type = "Custom"
    mode = "All"
    display_name = join(" - ", ["TF - Deny-PublicEndpoint-KeyVault", var.affix])
    provider = azurerm.ScDc-GCPASS-ICAS-Dev
    metadata = <<METADATA
    {
        "category": "TF Deny Policies"
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
  name = join(" - ", ["TF - Deny-PublicEndpoint-KeyVault", var.affix])
  provider = azurerm.ScDc-GCPASS-ICAS-Dev
  scope = var.scope
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-KeyVault.id
  description = "This policy restrict creation of Key Vaults with IP Firewall exposed to all public endpoints"
  display_name = join(" - ", ["TF - Deny-PublicEndpoint-KeyVault", var.affix])
}

/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-Sql" {
    name = join(" - ", ["TF - Deny-PublicEndpoint-Sql", var.affix])
    policy_type = "Custom"
    mode = "All"
    display_name = join(" - ", ["TF - Deny-PublicEndpoint-Sql", var.affix])
    provider = azurerm.ScDc-GCPASS-ICAS-Dev
    metadata = <<METADATA
    {
        "category": "TF Deny Policies"
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
  name = join(" - ", ["TF - Deny-PublicEndpoint-Sql", var.affix])
  provider = azurerm.ScDc-GCPASS-ICAS-Dev
  scope = var.scope
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-Sql.id
  description = "This policy restrict creation of Sql servers with exposed public endpoints"
  display_name = join(" - ", ["TF - Deny-PublicEndpoint-Sql", var.affix])
}

/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-Storage" {
    name = join(" - ", ["TF - Deny-PublicEndpoint-Storage", var.affix])
    policy_type = "Custom"
    mode = "All"
    display_name = join(" - ", ["TF - Deny-PublicEndpoint-Storage", var.affix])
    provider = azurerm.ScDc-GCPASS-ICAS-Dev
    metadata = <<METADATA
    {
        "category": "TF Deny Policies"
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
  name = join(" - ", ["TF - Deny-PublicEndpoint-Storage", var.affix])
  provider = azurerm.ScDc-GCPASS-ICAS-Dev
  scope = var.scope
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-Storage.id
  description = "This policy restrict creation of storage accounts with IP Firewall exposed to all public endpoints"
  display_name = join(" - ", ["TF - Deny-PublicEndpoint-Storage", var.affix])
}

/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-PublicEndpoint-Aks" {
    name = join(" - ", ["TF - Deny-PublicEndpoint-Aks", var.affix])
    policy_type = "Custom"
    mode = "All"
    display_name = join(" - ", ["TF - Deny-PublicEndpoint-Aks", var.affix])
    provider = azurerm.ScDc-GCPASS-ICAS-Dev
    metadata = <<METADATA
    {
        "category": "TF Deny Policies"
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
  name = join(" - ", ["TF - Deny-PublicEndpoint-Aks", var.affix])
  provider = azurerm.ScDc-GCPASS-ICAS-Dev
  scope = var.scope
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-PublicEndpoint-Aks.id
  description = "This policy restricts creation of non-private AKS clusters"
  display_name = join(" - ", ["TF - Deny-PublicEndpoint-Aks", var.affix])
}