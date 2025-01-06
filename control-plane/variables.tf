variable "control_plane_name" {
  description = "Name of the Kubernetes control plane instance"
  type        = string
}

variable "control_plane_type" {
  description = "Type of the Hetzner Cloud instance for the control plane"
  type        = string
}

variable "control_plane_image" {
  description = "Operating system image for the control plane"
  type        = string
}

variable "location" {
  description = "Hetzner data center location"
  type        = string

  validation {
    condition     = contains(["fsn1", "nbg1", "hel1"], var.location)
    error_message = "Location must be one of 'fsn1', 'nbg1', or 'hel1'."
  }
}

variable "network_id" {
  description = "Hetzner network ID to attach the control plane to. Obtain it from the Hetzner Cloud Console."
  type        = string
}

variable "subnet_range" {
  description = "CIDR range for the subnet to be used by the control plane"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key to be added to the control plane instance"
  type        = string
}

variable "ssh_private_key" {
  description = "SSH private key to connect to the control plane instance"
  type        = string
}