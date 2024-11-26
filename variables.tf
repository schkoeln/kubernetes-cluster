variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type        = string
}

variable "network_name" {
  description = "Name of the Hetzner network"
  default     = "k8s-network"
}

variable "subnet_cidr" {
  description = "CIDR block for the Hetzner subnet"
  default     = "10.0.0.0/16"
}

variable "control_plane_name" {
  description = "Name of the Kubernetes control plane instance"
  default     = "k8s-control-plane"
}

variable "control_plane_type" {
  description = "Type of the Kubernetes control plane instance"
  default     = "cx11"
}

variable "worker_name" {
  description = "Name of the worker node"
  default     = "game-server-worker"
}

variable "worker_type" {
  description = "Type of the worker node"
  default     = "EX42"
  validation {
    condition     = contains(["EX42", "EX52", "EX62"], var.worker_type)
    error_message = "Worker type must be one of 'EX42', 'EX52', or 'EX62'."
  }
}