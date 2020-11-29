variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in."
}

variable "gke_cluster_name" {
  type        = string
  description = "The cluster to create the node pool for. Cluster must be present in location provided for zonal clusters."
}

variable "location" {
  description = "The location (region or zone) of the GKE cluster."
  type        = string
}

variable "timeouts" {
  description = "Timeouts configuration"
  type        = any
  default = [{
    create = "30m",
    update = "30m",
    delete = "30m"
  }]
}

variable "node_pool_service_account" {
  type        = string
  description = "The service account to run nodes as."
}

variable "firewall_tag" {
  type        = string
  description = <<EOF
Instances in the network must be tagged with the following network tags in order for inbound traffic to be allowed to reach them. All other inbound traffic is denied, including internal traffic

public - allow inbound traffic from all sources
public-restricted - allow inbound traffic from specific subnetworks on the internet
private - allow inbound traffic from within this network
private-persistence - allow inbound traffic from tagged sources within this network, excluding instances tagged public
EOF
}

variable "machine_type" {
  type        = string
  description = "Type of the node compute engines."
}

variable "max_pods_per_node" {
  default     = 55
  type        = number
  description = "The maximum number of pods per node in this node pool."
}

variable "node_config_preemptible" {
  type        = bool
  default     = false
  description = "A preemptible VM is an instance that you can create and run at a much lower price than normal instances. However, Compute Engine might stop (preempt)"
}

variable "node_image_type" {
  type        = string
  default     = "COS"
  description = "The image type to use for this node. Note that changing the image type will delete and recreate all nodes in the node pool."
}

variable "initial_node_count" {
  type        = number
  default     = 1
  description = "The number of nodes to create in this cluster's default node pool."
}

variable "node_config_tags" {
  description = "Network tags applied to nodes."
  type        = list(string)
}

variable "node_config_labels" {
  description = "Kubernetes labels attached to nodes."
  type        = map(string)
  default     = {}
}

variable "autoscaling_config" {
  description = "Optional autoscaling configuration."
  type = object({
    min_node_count = number
    max_node_count = number
  })
}

variable "upgrade_config" {
  description = "Optional node upgrade configuration."
  type = object({
    max_surge       = number
    max_unavailable = number
  })
}

variable "management_config" {
  description = "Optional node management configuration."
  type = object({
    auto_repair  = bool
    auto_upgrade = bool
  })
  default = {
    auto_repair  = true
    auto_upgrade = true
  }
}

variable "node_pool_name" {
  type        = string
  description = "The name of the node pool. If left blank, Terraform will auto-generate a unique name."
}

variable "environment" {
  description = "The name of the environment."
  type        = string
}

variable "disk_size_gb" {
  type        = number
  default     = 10
  description = "Size of the node's disk."
}

variable "disk_type" {
  type    = string
  default = "pd-standard"
}
