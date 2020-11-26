

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A NODE POOL
# ---------------------------------------------------------------------------------------------------------------------

resource "google_container_node_pool" "node_pool" {
  provider = google-beta

  name     = "main-pool"
  project  = var.project_id
  location = var.location
  cluster  = module.gke_cluster.name

  initial_node_count = "1"
  max_pods_per_node  = var.max_pods_per_node
  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }
  upgrade_settings {
    max_surge       = var.node_max_surge
    max_unavailable = var.node_max_unavailable
  }
  node_config {
    image_type   = "COS"
    machine_type = var.machine_type

    labels = {
      node_type   = "general"
      environment = var.environment
    }

    # Add a public tag to the instances. See the network access tier table for full details:
    # https://github.com/gruntwork-io/terraform-google-network/tree/master/modules/vpc-network#access-tier
    tags = [
      module.network_firewall.private,
      "private-pool",
    ]

    disk_size_gb = var.disk_size_gb
    disk_type    = var.disk_type
    preemptible  = false

    service_account = module.service_accounts_general.email

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  lifecycle {
    ignore_changes = [
      initial_node_count
    ]
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}
