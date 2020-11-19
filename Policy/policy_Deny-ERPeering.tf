/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-ERPeering" {
    name = "TF - Deny-ERPeering - GK"
    policy_type = "Custom"
    mode = "All"
    display_name = "TF - Deny-ERPeering - GK"
    provider = azurerm.ScSc-PBMMCTOSandbox
    metadata = <<METADATA
    {
        "category": "Greg Test"
    }
    METADATA
    policy_rule = <<POLICY_RULE
    {
        "if": {
            "field": "type",
            "equals": "Microsoft.Network/virtualNetworks/virtualNetworkPeerings"
        },
            "then": {
            "effect": "deny"
        }
    }
    POLICY_RULE
    parameters = <<PARAMETERS
    {}
    PARAMETERS
}

/* Policy Assignment
-----------------------------------------------------*/
resource "azurerm_policy_assignment" "policy-assignment_Deny-ERPeering" {
  name = "TF - Deny-ERPeering - GK"
  provider = azurerm.ScSc-PBMMCTOSandbox
  scope = "/subscriptions/f3c68f92-f832-4632-82d5-c6c7a9e37e08/"
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-ERPeering.id
  description = "Denies creation of ER Peerings under the assigned scope."
  display_name = "TF - Deny-ERPeering - GK"
}