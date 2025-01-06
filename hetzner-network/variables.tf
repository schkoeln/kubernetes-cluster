variable "network_name" {
  description = "Name of the Hetzner private network"
  type        = string
}

variable "network_ip_range" {
  description = "The IP range of the network"
  type        = string
}

variable "network_zone" {
  description = "The network zone for the subnet"
  type        = string
}

variable "subnet_range" {
  description = "The CIDR range for the subnet"
  type        = string
}