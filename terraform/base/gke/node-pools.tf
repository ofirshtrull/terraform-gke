module "default_node_pool" {
  source           = "../../modules/node-pool"
  node_pool_name   = "default"
  project_id       = var.project_id
  gke_cluster_name = module.gke_cluster.name
  environment      = var.environment
  location         = var.location
  //  node_config_machine_type              = "g1-small"
  node_config_machine_type  = "e2-medium"
  node_pool_service_account = module.service_accounts_general.email
  node_config_preemptible   = true

  node_config_labels = {
    environment = var.environment
  }

  firewall_tag = module.network_firewall.private
  node_config_tags = [
    "private-pool",
  ]

  autoscaling_config = {
    min_node_count = 1
    max_node_count = 10
  }

  upgrade_config = {
    max_surge       = 1
    max_unavailable = 0
  }
}
