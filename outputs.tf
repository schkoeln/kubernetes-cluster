output "network_id" {
  value       = module.hetzner_network.network_id
  description = "ID of the Hetzner network"
}

output "control_plane_ip" {
  value       = module.control_plane.control_plane_ip
  description = "IP address of the control plane"
}

output "worker_node_ips" {
  value       = module.worker_nodes.worker_ips
  description = "IP address of the worker node"
}