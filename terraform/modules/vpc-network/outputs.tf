output "network" {
  description = "A reference (self_link) to the VPC network"
  value       = google_compute_network.vpc.*.self_link[0]
}

# ---------------------------------------------------------------------------------------------------------------------
# Public Subnetwork Outputs
# ---------------------------------------------------------------------------------------------------------------------

output "public_subnetwork" {
  description = "A reference (self_link) to the public subnetwork"
  value       = google_compute_subnetwork.vpc_subnetwork_public.*.self_link[0]
}

output "public_subnetwork_name" {
  description = "Name of the public subnetwork"
  value       = google_compute_subnetwork.vpc_subnetwork_public.*.name[0]
}

output "public_subnetwork_cidr_block" {
  value = google_compute_subnetwork.vpc_subnetwork_public.*.ip_cidr_range[0]
}

output "public_subnetwork_gateway" {
  value = google_compute_subnetwork.vpc_subnetwork_public.*.gateway_address[0]
}

output "public_subnetwork_secondary_cidr_block" {
  value = google_compute_subnetwork.vpc_subnetwork_public[0].secondary_ip_range[0].ip_cidr_range
}

output "public_subnetwork_secondary_range_name" {
  value = google_compute_subnetwork.vpc_subnetwork_public[0].secondary_ip_range[0].range_name
}

# ---------------------------------------------------------------------------------------------------------------------
# Private Subnetwork Outputs
# ---------------------------------------------------------------------------------------------------------------------

output "private_subnetwork" {
  description = "A reference (self_link) to the private subnetwork"
  value       = google_compute_subnetwork.vpc_subnetwork_private.*.self_link[0]
}

output "private_subnetwork_name" {
  description = "Name of the private subnetwork"
  value       = google_compute_subnetwork.vpc_subnetwork_private.*.name[0]
}

output "private_subnetwork_cidr_block" {
  value = google_compute_subnetwork.vpc_subnetwork_private.*.ip_cidr_range[0]
}

output "private_subnetwork_gateway" {
  value = google_compute_subnetwork.vpc_subnetwork_private.*.gateway_address[0]
}

output "private_subnetwork_secondary_cidr_block" {
  value = google_compute_subnetwork.vpc_subnetwork_private[0].secondary_ip_range[0].ip_cidr_range
}

output "private_subnetwork_secondary_range_name" {
  value = google_compute_subnetwork.vpc_subnetwork_private[0].secondary_ip_range[0].range_name
}
