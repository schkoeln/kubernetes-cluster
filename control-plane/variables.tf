variable "control_plane_name" {
  description = "Name of the Kubernetes control plane instance"
  type        = string
}

variable "control_plane_type" {
  description = "Type of the Hetzner Cloud instance for the control plane"
  type        = string
  default     = "cx11"
  validation {
    condition     = contains(["cx11", "cx21", "cx31"], var.control_plane_type)
    error_message = "Control plane type must be one of 'cx11', 'cx21', or 'cx31'."
  }
}

variable "control_plane_image" {
  description = "Operating system image for the control plane"
  type        = string
  default     = "ubuntu-22.04"
}

variable "location" {
  description = "Hetzner data center location"
  type        = string
  default     = "fsn1" # Falkenstein
  validation {
    condition     = contains(["fsn1", "nbg1", "hel1"], var.location)
    error_message = "Location must be one of 'fsn1', 'nbg1', or 'hel1'."
  }
}

variable "network_id" {
  description = "Hetzner network ID to attach the control plane to. Obtain it from the Hetzner Cloud Console."
  type        = string
}