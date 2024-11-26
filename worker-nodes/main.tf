resource "hcloud_server" "worker_node" {
  count      = var.worker_count
  name       = "${var.worker_name}-${count.index}"
  server_type = var.worker_type
  image      = var.worker_image
  location   = var.location

  network {
    network_id = var.network_id
  }

  labels = merge(
    {
      role = "worker"
      type = "game-server"
    },
    var.worker_labels
  )

  lifecycle {
    create_before_destroy = true
  }
}