module "service_accounts_general" {
  source        = "../../modules/service-accounts"
  project_id    = var.project_id
  names         = ["general"]
  generate_keys = false
  display_name  = "General Service account"
  description   = "General Service Account"
  project_roles = [
    format("%s=>roles/storage.objectViewer", var.project_id),
    format("%s=>roles/logging.logWriter", var.project_id),
    format("%s=>roles/monitoring.metricWriter", var.project_id),
    format("%s=>roles/monitoring.viewer", var.project_id),
    format("%s=>roles/stackdriver.resourceMetadata.writer", var.project_id)
  ]
}

module "service_accounts_dns" {
  source        = "../../modules/service-accounts"
  project_id    = var.project_id
  names         = ["dns-controller"]
  generate_keys = false
  display_name  = "Dns controller Service Accounts"
  description   = "Dns controller Service Accounts"
  project_roles = [
    format("%s=>roles/compute.loadBalancerAdmin", var.project_id),
    format("%s=>roles/dns.admin", var.project_id)
  ]
}

module "service_accounts_secrets" {
  source        = "../../modules/service-accounts"
  project_id    = var.project_id
  names         = ["secret-manager"]
  generate_keys = false
  display_name  = "Secret manager Service Accounts"
  description   = "secret-manager Service Accounts"
  project_roles = [
    format("%s=>roles/secretmanager.secretAccessor", var.project_id)
  ]
}

module "service_accounts_vpc" {
  source        = "../../modules/service-accounts"
  project_id    = var.project_id
  names         = ["vpc-sa"]
  generate_keys = false
  display_name  = "vpc Service Account"
  description   = "vpc Service Account"
  project_roles = [
    format("%s=>roles/compute.loadBalancerAdmin", var.project_id),
    format("%s=>roles/compute.networkAdmin", var.project_id)
  ]
}

module "service_accounts_loki" {
  source        = "../../modules/service-accounts"
  project_id    = var.project_id
  names         = ["loki-sa"]
  generate_keys = false
  display_name  = "loki Service Account"
  description   = "loki Service Account"
  project_roles = [
    format("%s=>roles/storage.objectCreator", var.project_id)
  ]
}
