terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.40"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.9"
    }
  }
  required_version = ">= 1.3.0"
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
  source      = "./modules/hetzner-network"
  network_name = var.network_name
  subnet_cidr  = var.subnet_cidr
}

module "control_plane" {
  source          = "./modules/control-plane"
  control_plane_name = var.control_plane_name
  control_plane_type = var.control_plane_type
  network_id         = module.hetzner_network.network_id
}

module "worker_nodes" {
  source      = "./modules/worker-nodes"
  worker_name = var.worker_name
  worker_type = var.worker_type
  network_id  = module.hetzner_network.network_id
}

module "helm_deployments" {
  source          = "./modules/helm-deployments"
  kubeconfig_path = "~/.kube/config"
}