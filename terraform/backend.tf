terraform {
  backend "azurerm" {
    resource_group_name  = "MC_Gal-Candidate_aks-cluster_westeurope"
    storage_account_name = "tfbackendstoragegal"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
