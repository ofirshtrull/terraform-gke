module "vpc_network" {
  source = "./modules/vpc-network"

  name_prefix = format("%s-%s-vpc", var.cluster_name, var.environment)
  project     = var.project_id
  region      = var.region

  cidr_block           = var.vpc_cidr_block
  secondary_cidr_block = var.vpc_secondary_cidr_block
}
