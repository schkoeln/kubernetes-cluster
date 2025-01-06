terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
  }
}

resource "hcloud_network" "k8s_network" {
  name     = var.network_name
  ip_range = var.network_ip_range
}

resource "hcloud_network_subnet" "subnet" {
  network_id   = hcloud_network.k8s_network.id
  type         = "cloud"
  network_zone = var.network_zone
  ip_range     = var.subnet_range
}
