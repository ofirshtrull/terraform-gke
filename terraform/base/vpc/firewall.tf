# ---------------------------------------------------------------------------------------------------------------------
# Attach Firewall Rules to allow inbound traffic to tagged instances
# ---------------------------------------------------------------------------------------------------------------------

module "network_firewall" {
  source = "../../modules/network-firewall"

  create_vpc_network = var.create_network
  name_prefix        = format("%s-%s-vpc", var.cluster_name, var.environment)

  project                               = var.project_id
  network                               = module.vpc_network.network
  allowed_public_restricted_subnetworks = var.allowed_public_restricted_subnetworks
  public_subnetwork                     = module.vpc_network.public_subnetwork
  private_subnetwork                    = module.vpc_network.private_subnetwork
}
