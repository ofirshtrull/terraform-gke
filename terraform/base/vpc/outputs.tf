
output "network" {
  value = module.vpc_network.network
}
output "public_subnetwork" {
  value = module.vpc_network.public_subnetwork
}
output "public_subnetwork_secondary_range_name" {
  value = module.vpc_network.public_subnetwork_secondary_range_name
}

# ---------------------------------------------------------------------------------------------------------------------
# Access Tier - Network Tags
# ---------------------------------------------------------------------------------------------------------------------

output "public" {
  description = "The network tag string used for the public access tier"
  value       = module.network_firewall[0].public
}

output "public_restricted" {
  description = "The string of the public tag"
  value       = module.network_firewall[0].public_restricted
}

output "private" {
  description = "The network tag string used for the private access tier"
  value       = module.network_firewall[0].private
}

output "private_persistence" {
  description = "The network tag string used for the private-persistence access tier"
  value       = module.network_firewall[0].private_persistence
}
