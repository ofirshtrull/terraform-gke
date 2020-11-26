variable "create_network" {
  type    = bool
  default = true
}
variable "region" {
  description = "The region for the network. If the cluster is regional, this must be the same region. Otherwise, it should be the region of the zone."
  type        = string
}

variable "location" {
  description = "The location (region or zone) of the GKE cluster."
  type        = string
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
}

variable "environment" {
  description = "The name of the environment."
  type        = string
}

variable "credentials" {
  type        = string
  description = "Location of the credentials keyfile."
}

variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in."
}

variable "zones" {
  type        = list(string)
  description = "The zones to host the cluster in."
}

variable "name" {
  type        = string
  description = "The name of the cluster."
}

variable "machine_type" {
  type        = string
  description = "Type of the node compute engines."
}

variable "min_node_count" {
  type        = number
  description = "Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count."
}

variable "max_node_count" {
  type        = number
  description = "Maximum number of nodes in the NodePool. Must be >= min_node_count."
}

variable "node_max_surge" {
  type        = number
  default     = 1
  description = "The number of additional nodes that can be added to the node pool during an upgrade."
}

variable "node_max_unavailable" {
  type        = number
  default     = 0
  description = "The number of nodes that can be simultaneously unavailable during an upgrade."
}

variable "disk_size_gb" {
  type        = number
  description = "Size of the node's disk."
}

variable "service_account" {
  type        = string
  description = "The service account to run nodes as if not overridden in `node_pools`. The create_service_account variable default value (true) will cause a cluster-specific service account to be created."
}

variable "initial_node_count" {
  type        = number
  description = "The number of nodes to create in this cluster's default node pool."
}




variable "master_ipv4_cidr_block" {
  description = "The IP range in CIDR notation (size must be /28) to use for the hosted master network. This range will be used for assigning internal IP addresses to the master or set of masters, as well as the ILB VIP. This range must not overlap with any other ranges in use within the cluster's network."
  type        = string
  default     = "10.5.0.0/28"
}

# For the example, we recommend a /16 network for the VPC. Note that when changing the size of the network,
# you will have to adjust the 'cidr_subnetwork_width_delta' in the 'vpc_network' -module accordingly.
variable "vpc_cidr_block" {
  description = "The IP address range of the VPC in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27."
  type        = string
  default     = "10.3.0.0/16"
}

# For the example, we recommend a /16 network for the secondary range. Note that when changing the size of the network,
# you will have to adjust the 'cidr_subnetwork_width_delta' in the 'vpc_network' -module accordingly.
variable "vpc_secondary_cidr_block" {
  description = "The IP address range of the VPC's secondary address range in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27."
  type        = string
  default     = "10.4.0.0/16"
}

variable "enable_vertical_pod_autoscaling" {
  description = "Enable vertical pod autoscaling"
  type        = string
  default     = true
}

variable "cluster_service_account_description" {
  description = "A description of the custom service account used for the GKE cluster."
  type        = string
  default     = "Example GKE Cluster Service Account managed by Terraform"
}

# Kubectl options

variable "kubectl_config_path" {
  description = "Path to the kubectl config file. Defaults to $HOME/.kube/config"
  type        = string
  default     = ""
}

variable "override_default_node_pool_service_account" {
  description = "When true, this will use the service account that is created for use with the default node pool that comes with all GKE clusters"
  type        = bool
  default     = false
}

variable allowed_public_restricted_subnetworks {
  description = "The public networks that is allowed access to the public_restricted subnetwork of the network"
  default     = []
  type        = list(string)
}

variable "max_pods_per_node" {
  default     = 55
  type        = number
  description = "The maximum number of pods per node in this node pool."
}

variable "auto_repair" {
  type        = bool
  default     = true
  description = "Whether the nodes will be automatically repaired."
}
variable "auto_upgrade" {
  type        = bool
  default     = true
  description = "Whether the nodes will be automatically upgraded."
}

variable "disk_type" {
  type    = string
  default = "pd-standard"
}

variable "enable_private_nodes" {
  description = "Control whether nodes have internal IP addresses only. If enabled, all nodes are given only RFC 1918 private addresses and communicate with the master via private networking."
  type        = bool
  default     = false
}
