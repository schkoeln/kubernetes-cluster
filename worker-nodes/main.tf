terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
  }
}

resource "hcloud_server" "worker_node" {
  count       = var.worker_count
  name        = "${var.worker_name}-${count.index}"
  server_type = var.worker_type
  image       = var.worker_image
  location    = var.location

  ssh_keys = [var.ssh_public_key]

  network {
    network_id = var.network_id
    ip         = cidrhost(var.subnet_range, 2)
  }

  labels = merge(
    {
      role = "worker"
      type = "wordpress-server"
    },
    var.worker_labels
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "null_resource" "join_kubernetes_cluster" {
  count      = var.worker_count
  depends_on = [hcloud_server.worker_node]

  connection {
    type        = "ssh"
    host        = hcloud_server.worker_node[count.index].ipv4_address
    user        = "root"
    private_key = var.ssh_private_key
  }

  provisioner "remote-exec" {
    script = "/workspaces/kubernetes-cluster/scripts/join_kubernetes_cluster.sh"
  }
}