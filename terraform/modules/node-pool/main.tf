
resource "google_container_node_pool" "default" {
  provider = google-beta

  name     = format("%s-%s", var.node_pool_name, var.environment)
  project  = var.project_id
  location = var.location
  cluster  = var.gke_cluster_name // module.gke_cluster.name

  initial_node_count = var.initial_node_count
  max_pods_per_node  = var.max_pods_per_node

  node_config {
    image_type   = var.node_config_image_type
    machine_type = var.node_config_machine_type

    local_ssd_count = var.node_config_local_ssd_count
    disk_size_gb    = var.node_config_disk_size
    disk_type       = var.node_config_disk_type
    preemptible     = var.node_config_preemptible

    labels = var.node_config_labels
    # Add a public tag to the instances. See the network access tier table for full details:
    # https://github.com/gruntwork-io/terraform-google-network/tree/master/modules/vpc-network#access-tier
    tags = flatten([var.node_config_tags, var.firewall_tag])



    service_account = var.node_pool_service_account

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  dynamic upgrade_settings {
    for_each = var.upgrade_config != null ? [var.upgrade_config] : []
    iterator = config
    content {
      max_surge       = config.value["max_surge"]
      max_unavailable = config.value["max_unavailable"]
    }
  }

  dynamic autoscaling {
    for_each = var.autoscaling_config != null ? [var.autoscaling_config] : []
    iterator = config
    content {
      min_node_count = config.value["min_node_count"]
      max_node_count = config.value["max_node_count"]
    }
  }

  dynamic management {
    for_each = var.management_config != null ? [var.management_config] : []
    iterator = config
    content {
      auto_repair  = config.value["auto_repair"]
      auto_upgrade = config.value["auto_upgrade"]
    }
  }


  dynamic "timeouts" {
    for_each = var.timeouts
    content {
      create = lookup(timeouts.value, "create", null)
      update = lookup(timeouts.value, "update", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

  lifecycle {
    ignore_changes = [
      initial_node_count
    ]
  }
}
