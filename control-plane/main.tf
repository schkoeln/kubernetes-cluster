resource "hcloud_server" "control_plane" {
  name        = var.control_plane_name
  server_type = var.control_plane_type
  image       = var.control_plane_image
  location    = var.location
  network {
    network_id = var.network_id
  }

  labels = {
    role = "control-plane"
  }

  lifecycle {
    create_before_destroy = true
  }
}