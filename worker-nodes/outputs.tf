output "worker_ips" {
  value       = [for server in hcloud_server.worker_node : server.ipv4_address]
  description = "IP addresses of the worker nodes"
}

output "worker_ids" {
  value       = [for server in hcloud_server.worker_node : server.id]
  description = "IDs of the worker nodes"
}