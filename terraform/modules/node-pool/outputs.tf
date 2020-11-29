
output "name" {
  description = "Nodepool name."
  value       = google_container_node_pool.default.name
}

output "id" {
  description = "Nodepool id."
  value       = google_container_node_pool.default.id
}
