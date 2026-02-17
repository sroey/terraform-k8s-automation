terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

# This uses your local Kubeconfig file that k3d created automatically
provider "kubernetes" {
  config_path = "~/.kube/config"
}