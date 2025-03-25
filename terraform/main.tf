resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aksdns"
  oidc_issuer_enabled = true 

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "basic"
  }

}

resource "github_actions_secret" "aks_kubeconfig" {
  repository      = "2bcloud"
  secret_name     = "KUBECONFIG_DATA"
  plaintext_value = base64encode(azurerm_kubernetes_cluster.aks.kube_config_raw)
}

