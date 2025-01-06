output "network_id" {
  value       = hcloud_network.k8s_network.id
  description = "The ID of the Hetzner network"
}
