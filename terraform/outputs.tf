//
//output "cluster_endpoint" {
//  description = "The IP address of the cluster master."
//  sensitive   = true
//  value       = module.gke_cluster.endpoint
//}
//
//output "client_certificate" {
//  description = "Public certificate used by clients to authenticate to the cluster endpoint."
//  value       = module.gke_cluster.client_certificate
//}
//
//output "client_key" {
//  description = "Private key used by clients to authenticate to the cluster endpoint."
//  sensitive   = true
//  value       = module.gke_cluster.client_key
//}
//
//output "cluster_ca_certificate" {
//  description = "The public certificate that is the root of trust for the cluster."
//  sensitive   = true
//  value       = module.gke_cluster.cluster_ca_certificate
//}

//# ---------------------------------------------------------------------------------------------------------------------
//# Access Tier - Network Tags
//# ---------------------------------------------------------------------------------------------------------------------
//
//output "public" {
//  description = "The network tag string used for the public access tier"
//  value       = module.network_firewall[0].public
//}
//
//output "public_restricted" {
//  description = "The string of the public tag"
//  value       = module.network_firewall[0].public_restricted
//}
//
//output "private" {
//  description = "The network tag string used for the private access tier"
//  value       = module.network_firewall[0].private
//}
//
//output "private_persistence" {
//  description = "The network tag string used for the private-persistence access tier"
//  value       = module.network_firewall[0].private_persistence
//}
