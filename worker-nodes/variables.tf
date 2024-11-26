variable "worker_name" {
  description = "Base name for the worker nodes"
  type        = string
  default     = "worker"
}

variable "worker_type" {
  description = "Hetzner server type for the worker node"
  type        = string
  default     = "EX42" # Example dedicated server type
}

variable "worker_image" {
  description = "OS image to use for the worker nodes"
  type        = string
  default     = "ubuntu-22.04"
}

variable "worker_count" {
  description = "Number of worker nodes to deploy"
  type        = number
  default     = 1
}

variable "location" {
  description = "Hetzner data center location"
  type        = string
  default     = "fsn1" # Falkenstein
}

variable "network_id" {
  description = "Hetzner network ID to attach the worker nodes to"
  type        = string
}

variable "worker_labels" {
  description = "Custom labels for the worker nodes"
  type        = map(string)
  default     = {}
}