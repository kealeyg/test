/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-IP-Forwarding" {
    name = join(" - ", ["TF - Deny-IP-Forwarding", var.affix])
    policy_type = "Custom"
    mode = "All"
    display_name = join(" - ", ["TF - Deny-IP-Forwarding", var.affix])
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
                "equals": "Microsoft.Network/networkInterfaces"
            },{
                "field": "Microsoft.Network/networkInterfaces/enableIpForwarding",
                "equals": "true"
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
resource "azurerm_policy_assignment" "policy-assignment_Deny-IP-Forwarding" {
  name = join(" - ", ["TF - Deny-IP-Forwarding", var.affix])
  provider = azurerm.ScDc-GCPASS-ICAS-Dev
  scope = var.scope
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-IP-Forwarding.id
  description = "Deny IP Forwarding on Vitual Machines"
  display_name = join(" - ", ["TF - Deny-IP-Forwarding", var.affix])
}