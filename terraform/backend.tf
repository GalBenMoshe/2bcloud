# resource "azurerm_storage_account" "tf_backend" {
#   name                     = "tfbackendstoragegal"
#   resource_group_name      = var.resource_group_name
#   location                 = var.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_storage_container" "tf_state" {
#   name                 = "tfstate"
#   storage_account_name   = azurerm_storage_account.tf_backend.name
#   container_access_type = "private"
# }

terraform {
  backend "azurerm" {
    resource_group_name  = var.resource_group_name
    storage_account_name = var.storage_account_name
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
