terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  storage_use_azuread = true
}

#variable "prefix" {}

#variable "region" {
#  type        = string
#  default     = "eastus2"
#  description = "The Azure region to deploy resources"
#  validation {
#    condition     = contains(["UK South", "UK West", "Spain Central", "West Europe", "eastus2", "West US"], var.region)
#    error_message = "Invalid region"
#  }
#}

#variable "tags" {
#  type        = map(any)
#  description = "A map of tags"
#}

module "demo" {
   source = "./modules/demo"
      
   prefix = var.prefix
   region = var.region
   resource_groups = var.resource_groups
   virtual_networks = var.virtual_networks
   tags = var.tags
 } 
 
moved {
   from = azurerm_resource_group.demo
   to   = module.demo.azurerm_resource_group.demo
 }
    
 moved {
   from = azurerm_virtual_network.demo
   to   = module.demo.azurerm_virtual_network.demo
 }
    
 moved {
   from = azurerm_subnet.demo
   to   = module.demo.azurerm_subnet.demo
 }

