# token for Hetzner Cloud API
variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type        = string
}


# Hetzner network
variable "network_name" {
  description = "Name of the Hetzner network"
  type        = string
  default     = "k8s-network"
}

variable "network_ip_range" {
  description = "IP range for the Hetzner network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_range" {
  description = "CIDR range for the subnet to be used by the worker nodes and control plane"
  type        = string
  default     = "10.0.1.0/24"
}

variable "network_zone" {
  description = "The network zone for the subnet"
  type        = string
  default     = "eu-central"
}


# Data center location
variable "location" {
  description = "Hetzner data center location"
  type        = string
  default     = "fsn1" # Falkenstein
}


# Control plane
variable "control_plane_name" {
  description = "Name of the Kubernetes control plane instance"
  type        = string
  default     = "k8s-control-plane"
}

variable "control_plane_type" {
  description = "Type of the Kubernetes control plane instance"
  type        = string
  default     = "cx22"
}

variable "control_plane_image" {
  description = "Operating system image for the control plane"
  type        = string
  default     = "ubuntu-20.04"
}

# Worker nodes
variable "worker_name" {
  description = "Name of the worker node"
  type        = string
  default     = "wordpress-worker"
}

variable "worker_type" {
  description = "Hetzner server type for the worker node"
  type        = string
  default     = "cx22"
}

variable "worker_image" {
  description = "OS image to use for the worker nodes"
  type        = string
  default     = "ubuntu-20.04"
}

variable "worker_count" {
  description = "Number of worker nodes to deploy"
  type        = number
  default     = 1
}