resource_groups = {
   dev     = "lucia_research_dev_rg"
   staging = "lucia_research_staging_rg"
   prod    = "lucia_research_prod_rg"
 }

# terraform.tfvars
 tags = {
   cost_center = "contoso research"    
 }

 virtual_networks = {
   dev = {
     name               = "vnet-dev"
     resource_group_key = "dev"
     address_space      = ["10.0.0.0/16"]
     subnets = {
       subnet1 = {
         name           = "subnet-dev-1"
         address_prefix = "10.0.0.0/24"
       }
     }
   }
   staging = {
     name               = "vnet-staging"
     resource_group_key = "staging"
     address_space      = ["10.1.0.0/16"]
     subnets = {
       subnet1 = {
         name           = "subnet-staging-1"
         address_prefix = "10.1.0.0/24"
       }
     }
   }
   prod = {
     name               = "vnet-prod"
     resource_group_key = "prod"
     address_space      = ["10.2.0.0/16"]
     subnets = {
       subnet1 = {
         address_prefix = "10.2.0.0/24"
       }
       subnet2 = {
         address_prefix = "10.2.1.0/24"
       }
     }
   }
 }