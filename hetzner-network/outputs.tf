output "network_id" {
  value       = hcloud_network.k8s_network.id
  description = "The ID of the Hetzner network"
}

output "subnet_id" {
  value       = hcloud_subnet.k8s_subnet.id
  description = "The ID of the Hetzner subnet"
}