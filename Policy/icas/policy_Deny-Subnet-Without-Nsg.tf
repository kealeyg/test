/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-Subnets-Without-NSG" {
    name = join(" - ", ["TF - Deny-Subnets-Without-NSG", var.affix])
    policy_type = "Custom"
    mode = "All"
    display_name = join(" - ", ["TF - Deny-Subnets-Without-NSG", var.affix])
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
                "equals": "Microsoft.Network/virtualNetworks/subnets"
            },{
                "field": "Microsoft.Network/virtualNetworks/subnets/networkSecurityGroup.id",
                "exists": "false"
            }]
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
resource "azurerm_policy_assignment" "policy-assignment_Deny-Subnets-Without-NSG" {
  name = join(" - ", ["TF - Deny-Subnets-Without-NSG", var.affix])
  provider = azurerm.ScDc-GCPASS-ICAS-Dev
  scope = var.scope
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-Subnets-Without-NSG.id
  description = "Deny-Subnets-Without-NSG"
  display_name = join(" - ", ["TF - Deny-Subnets-Without-NSG", var.affix])
}