terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
  }
}

resource "hcloud_server" "control_plane" {
  name        = var.control_plane_name
  server_type = var.control_plane_type
  image       = var.control_plane_image
  location    = var.location

  ssh_keys = [var.ssh_public_key]

  network {
    network_id = var.network_id
    ip         = cidrhost(var.subnet_range, 1)
  }

  labels = {
    role = "control-plane"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "null_resource" "install_kubernetes" {
  depends_on = [hcloud_server.control_plane]

  connection {
    type        = "ssh"
    host        = hcloud_server.control_plane.ipv4_address
    user        = "root"
    private_key = var.ssh_private_key
  }

  provisioner "remote-exec" {
    script = "/workspaces/kubernetes-cluster/scripts/install_kubernetes.sh"
  }
}