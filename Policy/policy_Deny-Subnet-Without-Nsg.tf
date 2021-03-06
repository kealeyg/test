/* Policy Definition
-----------------------------------------------------*/
resource "azurerm_policy_definition" "policy-definition_Deny-Subnets-Without-NSG" {
    name = "TF - Deny-Subnets-Without-NSG - GK"
    policy_type = "Custom"
    mode = "All"
    display_name = "TF - Deny-Subnets-Without-NSG - GK"
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
  name = "TF - Deny-Subnets-Without-NSG - GK"
  provider = azurerm.ScSc-PBMMCTOSandbox
  scope = "/subscriptions/f3c68f92-f832-4632-82d5-c6c7a9e37e08/"
  policy_definition_id = azurerm_policy_definition.policy-definition_Deny-Subnets-Without-NSG.id
  description = "Deny-Subnets-Without-NSG"
  display_name = "TF - Deny-Subnets-Without-NSG - GK"
}