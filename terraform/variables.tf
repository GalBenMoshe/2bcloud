variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "Gal-Candidate"
}

variable "location" {
  description = "Azure region for the AKS cluster"
  type        = string
  default     = "West Europe"
}

variable "aks_name" {
  description = "Name of the AKS cluster"
  type        = string
  default     = "aks-cluster"
}

variable "node_count" {
  description = "Number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "VM size for the worker nodes"
  type        = string
  default     = "Standard_D2_v2"
}