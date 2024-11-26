resource "hcloud_network" "k8s_network" {
  name     = var.network_name
  ip_range = var.network_ip_range
}

resource "hcloud_subnet" "k8s_subnet" {
  network_id   = hcloud_network.k8s_network.id
  type         = "cloud"
  network_zone = "eu-central"
  cidr         = var.subnet_cidr
  depends_on   = [hcloud_network.k8s_network]
}