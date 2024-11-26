variable "network_name" {
  description = "Name of the Hetzner private network"
  type        = string
}

variable "network_ip_range" {

  description = "The IP range of the network"

  type        = string

}

variable "subnet_cidr" {
  description = "CIDR block for the Hetzner subnet"
  type        = string
}