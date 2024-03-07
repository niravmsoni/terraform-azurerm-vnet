# Creating RG and Security VNet
resource "azurerm_resource_group" "vnet_sec" {
  name     = var.sec_resource_group_name
  location = var.location
  
  tags = {
    environment = "security"
    costcenter  = "security"
  }
}

module "vnet-sec" {
  source              = "Azure/vnet/azurerm"
  version             = "~> 2.0"
  resource_group_name = azurerm_resource_group.vnet_sec.name
  vnet_name           = var.sec_resource_group_name
  address_space       = [var.vnet_cidr_range]
  subnet_prefixes     = var.sec_subnet_prefixes
  subnet_names        = var.sec_subnet_names
  nsg_ids             = {}

  tags = {
    environment = "security"
    costcenter  = "security"
  }

  depends_on = [azurerm_resource_group.vnet_sec]
}