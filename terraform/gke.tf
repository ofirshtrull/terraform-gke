
module "gke_cluster" {
  source = "./modules/gke-cluster"

  name     = format("%s-%s", var.cluster_name, var.environment)
  project  = var.project_id
  location = var.location

  network                             = coalesce(var.network, module.vpc_network.network)
  subnetwork                          = coalesce(var.subnetwork, module.vpc_network.public_subnetwork)
  cluster_secondary_range_name        = coalesce(var.cluster_secondary_range_name, module.vpc_network.public_subnetwork_secondary_range_name)
  enable_private_nodes                = var.enable_private_nodes
  alternative_default_service_account = var.override_default_node_pool_service_account ? module.service_accounts_general.email : null
  master_ipv4_cidr_block              = var.master_ipv4_cidr_block
  master_global_access_config         = true

  enable_vertical_pod_autoscaling = var.enable_vertical_pod_autoscaling

  resource_labels = {
    environment = var.environment
  }

  master_authorized_networks_config = var.master_authorized_networks_config
}

# ---------------------------------------------------------------------------------------------------------------------
# CONFIGURE KUBECTL AND RBAC ROLE PERMISSIONS
# ---------------------------------------------------------------------------------------------------------------------

# configure kubectl with the credentials of the GKE cluster
resource "null_resource" "configure_kubectl" {
  provisioner "local-exec" {
    command = format(
      "gcloud beta container clusters get-credentials %s --region %s --project %s",
    module.gke_cluster.name, var.region, var.project_id)

    # Use environment variables to allow custom kubectl config paths
    environment = {
      KUBECONFIG = var.kubectl_config_path != "" ? var.kubectl_config_path : ""
    }
  }
  depends_on = [
    module.default_node_pool
  ]
}
