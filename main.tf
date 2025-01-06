terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.49"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.16"
    }
  }
  required_version = ">= 1.9.8"
}

provider "hcloud" {
  token = var.hcloud_token
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "hetzner_network" {
  source           = "./hetzner-network"
  network_name     = var.network_name
  network_ip_range = var.network_ip_range
  network_zone     = var.network_zone
  subnet_range     = var.subnet_range

  providers = {
    hcloud = hcloud
  }
}

resource "hcloud_ssh_key" "default" {
  name       = "default"
  public_key = file("/workspaces/kubernetes-cluster/ssh/id_rsa.pub")
}

module "control_plane" {
  source              = "./control-plane"
  location            = var.location
  control_plane_name  = var.control_plane_name
  control_plane_type  = var.control_plane_type
  control_plane_image = var.control_plane_image
  network_id          = module.hetzner_network.network_id
  subnet_range        = var.subnet_range
  ssh_public_key      = hcloud_ssh_key.default.id
  ssh_private_key     = file("/workspaces/kubernetes-cluster/ssh/id_rsa")

  providers = {
    hcloud = hcloud
  }
}

module "worker_nodes" {
  source          = "./worker-nodes"
  location        = var.location
  worker_name     = var.worker_name
  worker_type     = var.worker_type
  worker_image    = var.worker_image
  worker_count    = var.worker_count
  network_id      = module.hetzner_network.network_id
  subnet_range    = var.subnet_range
  ssh_public_key  = hcloud_ssh_key.default.id
  ssh_private_key = file("/workspaces/kubernetes-cluster/ssh/id_rsa")

  providers = {
    hcloud = hcloud
  }
}

module "helm_deployments" {
  source          = "./helm-deployments"
  kubeconfig_path = "~/.kube/config"

  providers = {
    helm = helm
  }
}
