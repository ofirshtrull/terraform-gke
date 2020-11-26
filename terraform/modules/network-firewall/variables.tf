
variable "network" {
  description = "A reference (self_link) to the VPC network to apply firewall rules to"
  type        = string
}

variable "public_subnetwork" {
  description = "A reference (self_link) to the public subnetwork of the network"
  type        = string
}

variable allowed_public_restricted_subnetworks {
  description = "The public networks that is allowed access to the public_restricted subnetwork of the network"
  default     = []
  type        = list(string)
}

variable "private_subnetwork" {
  description = "A reference (self_link) to the private subnetwork of the network"
  type        = string
}

variable "project" {
  description = "The project to create the firewall rules in. Must match the network project."
  type        = string
}

variable "name_prefix" {
  description = "A name prefix used in resource names to ensure uniqueness across a project."
  type        = string
}

variable "create_vpc_network" {
  type        = bool
  default     = true
  description = "Create or not a vpc."
}
