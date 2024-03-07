# Create Random Pwd that is 16 characters long and with special characters
resource "random_password" "vnet_peering" {
  length  = 16
  special = true
}

# Creating an Azure-Ad application for SP
resource "azuread_application" "vnet_peering" {
  display_name = "vnet-peer"
}

# Create Azure AD Service Principal(SP)
resource "azuread_service_principal" "vnet_peering" {
  application_id = azuread_application.vnet_peering.application_id
}

# Assign Pwd to SP
resource "azuread_service_principal_password" "vnet_peering" {
  service_principal_id = azuread_service_principal.vnet_peering.id
  value                = random_password.vnet_peering.result
  end_date_relative    = "17520h"   # Pwd Expiry date
}

# Create a role in security subscription
resource "azurerm_role_definition" "vnet-peering" {
  name  = "allow-vnet-peering"
  scope = data.azurerm_subscription.current.id

  permissions {
    actions     = ["Microsoft.Network/virtualNetworks/virtualNetworkPeerings/write", "Microsoft.Network/virtualNetworks/peer/action", "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/read", "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/delete"]
    not_actions = []
  }

  assignable_scopes = [
    # We get this from data.tf
    data.azurerm_subscription.current.id,
  ]
}

# Assign that role to SP
resource "azurerm_role_assignment" "vnet" {
  # Resource ID of VNet
  scope              = module.vnet-sec.vnet_id
  role_definition_id = azurerm_role_definition.vnet-peering.role_definition_resource_id
  principal_id       = azuread_service_principal.vnet_peering.id
}

#############################################################################
# FILE OUTPUT
#############################################################################
# Exporting all the configurations and placing them in a file windows-next-step.txt
resource "local_file" "windows" {
  filename = "${path.module}/windows-next-step.txt"
  content  = <<EOF
$env:TF_VAR_sec_vnet_id="${module.vnet-sec.vnet_id}"

$env:TF_VAR_sec_vnet_name="${module.vnet-sec.vnet_name}"
$env:TF_VAR_sec_sub_id="${data.azurerm_subscription.current.subscription_id}"
$env:TF_VAR_sec_client_id="${azuread_service_principal.vnet_peering.application_id}"
$env:TF_VAR_sec_principal_id="${azuread_service_principal.vnet_peering.id}"
$env:TF_VAR_sec_client_secret="${random_password.vnet_peering.result}"
$env:TF_VAR_sec_resource_group="${var.sec_resource_group_name}"
$env:TF_VAR_sec_tenant_id="${data.azurerm_subscription.current.tenant_id}"

  EOF
}