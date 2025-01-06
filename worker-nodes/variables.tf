# Worker Node Name
variable "worker_name" {
  description = "Base name for the worker nodes"
  type        = string
  default     = "wordpress-worker"
}

# Worker Node Type (Hetzner Cloud Instance Types)
variable "worker_type" {
  description = "Hetzner server type for the worker node"
  type        = string
}

# Worker OS Image
variable "worker_image" {
  description = "OS image to use for the worker nodes"
  type        = string
}

# Worker Node Count
variable "worker_count" {
  description = "Number of worker nodes to deploy"
  type        = number

  validation {
    condition     = var.worker_count > 0
    error_message = "Worker count must be greater than 0."
  }
}

# Hetzner Data Center Location
variable "location" {
  description = "Hetzner data center location"
  type        = string

  validation {
    condition     = contains(["fsn1", "nbg1", "hel1"], var.location)
    error_message = "Location must be one of 'fsn1', 'nbg1', or 'hel1'."
  }
}

# Hetzner Network ID
variable "network_id" {
  description = "Hetzner network ID to attach the worker nodes to"
  type        = string
}

# Custom Labels for Worker Nodes
variable "worker_labels" {
  description = "Custom labels for the worker nodes"
  type        = map(string)
  default     = {}
}

variable "ssh_public_key" {
  description = "SSH public key to be added to the worker nodes"
  type        = string
}

variable "ssh_private_key" {
  description = "SSH private key to connect to the worker nodes"
  type        = string
}

variable "subnet_range" {
  description = "CIDR range for the subnet to be used by the worker nodes"
  type        = string
}