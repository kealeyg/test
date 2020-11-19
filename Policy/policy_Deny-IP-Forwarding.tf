/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-IP-Forwarding" {
    name = "TF - Deny-IP-Forwarding - GK"
    policy_type = "Custom"
    mode = "All"
    display_name = "TF - Deny-IP-Forwarding - GK"
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
  name = "TF - Deny-IP-Forwarding - GK"
  provider = azurerm.ScSc-PBMMCTOSandbox
  scope = "/subscriptions/f3c68f92-f832-4632-82d5-c6c7a9e37e08/"
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-IP-Forwarding.id
  description = "Deny IP Forwarding on Vitual Machines"
  display_name = "TF - Deny-IP-Forwarding - GK"
}