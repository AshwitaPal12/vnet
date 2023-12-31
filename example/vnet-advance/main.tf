provider "azurerm" {
  features {}
}

module "vnet_main" {
  #source = "git::https://github.com/tothenew/terraform-azure-vnet.git?ref=vnet-v1"
  source = "../.."
  address_space     = "10.0.0.0/16"  
  subnets = {
     "vm1" = {
      address_prefixes = ["10.0.1.0/24"]
      associate_with_route_table = true   
      is_natgateway = true 
      is_nsg = true
      service_delegation = true
      delegation_name = "Microsoft.ContainerInstance/containerGroups"
      delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }   
    "vm2" = {
    address_prefixes = ["10.0.2.0/24"]
    associate_with_route_table = false    
    } 
  }
}
 
