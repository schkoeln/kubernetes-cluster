output "control_plane_ip" {
  value       = hcloud_server.control_plane.ipv4_address
  description = "Public IP address of the control plane"
}

output "control_plane_id" {
  value       = hcloud_server.control_plane.id
  description = "ID of the control plane server"
}