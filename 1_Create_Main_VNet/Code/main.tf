# Creating a resouce group with values supplied in variables
resource "azurerm_resource_group" "vnet_main" {
  name     = var.resource_group_name
  location = var.location
}

# Creating a VNet using Azure Vnet Module and passing relevant input variables
module "vnet-main" {
  source              = "Azure/vnet/azurerm"
  version             = "~> 2.0"
  resource_group_name = azurerm_resource_group.vnet_main.name
  vnet_name           = var.resource_group_name
  address_space       = [var.vnet_cidr_range]
  subnet_prefixes     = var.subnet_prefixes
  subnet_names        = var.subnet_names
  nsg_ids             = {}

  tags = {
    environment = "dev"
    costcenter  = "it"

  }

# Specifying explicit dependency so that RG gets created first
  depends_on = [azurerm_resource_group.vnet_main]
}