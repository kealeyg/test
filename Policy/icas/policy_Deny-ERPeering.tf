/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-ERPeering" {
    name = join(" - ", ["TF - Deny-ERPeering", var.affix])
    policy_type = "Custom"
    mode = "All"
    display_name = join(" - ", ["TF - Deny-ERPeering", var.affix])
    provider = azurerm.ScDc-GCPASS-ICAS-Dev
    metadata = <<METADATA
    {
        "category": "TF Deny Policies"
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
  name = join(" - ", ["TF - Deny-ERPeering", var.affix])
  provider = azurerm.ScDc-GCPASS-ICAS-Dev
  scope = var.scope
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-ERPeering.id
  description = "Denies creation of ER Peerings under the assigned scope."
  display_name = join(" - ", ["TF - Deny-ERPeering", var.affix])
}