terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.112.0" 
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }

  }
}

provider "azurerm" {
  features {}
}
provider "github" {
  token = var.github_token
}