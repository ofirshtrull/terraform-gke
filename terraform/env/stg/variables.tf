
variable "region" {
  description = "The region for the network. If the cluster is regional, this must be the same region. Otherwise, it should be the region of the zone."
  type        = string
  default     = "us-central1"
}
variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in."
  default     = "ornate-veld-292519"
}
