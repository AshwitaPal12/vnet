provider "azurerm" {
  features {}
}

module "vnet_main" {
  #source = "git::https://github.com/tothenew/terraform-azure-vnet.git?ref=vnet-v1"
  #source = "../.."
  source = "git::https://github.com/AshwitaPal12/vnet.git"
  address_space  = "10.0.0.0/16"
  subnet_type = "subnet_simple" 
  subnet_bits = 3 
  subnets = { } 
}

