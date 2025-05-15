
provider "azurerm" {
  features = {}
}

resource "azurerm_resource_group" "rg" {
  name     = "multicloud-azure-rg"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "multicloud-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "multicloudaks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Multicloud"
  }
}
