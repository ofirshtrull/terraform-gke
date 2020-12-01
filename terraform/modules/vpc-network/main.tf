
resource "google_compute_network" "vpc" {
  count = var.create_vpc ? 1 : 0

  name    = format("%s-network", var.name_prefix)
  project = var.project

  # Always define custom subnetworks- one subnetwork per region isn't useful for an opinionated setup
  auto_create_subnetworks = "false"

  # A global routing mode can have an unexpected impact on load balancers; always use a regional mode
  routing_mode = "REGIONAL"
}

resource "google_compute_router" "vpc_router" {
  count = var.create_vpc ? 1 : 0

  name = format("%s-router", var.name_prefix)

  project = var.project
  region  = var.region
  network = google_compute_network.vpc.*.self_link[0]
}

# ---------------------------------------------------------------------------------------------------------------------
# Public Subnetwork Config
# Public internet access for instances with addresses is automatically configured by the default gateway for 0.0.0.0/0
# External access is configured with Cloud NAT, which subsumes egress traffic for instances without external addresses
# ---------------------------------------------------------------------------------------------------------------------

resource "google_compute_subnetwork" "vpc_subnetwork_public" {
  count = var.create_vpc ? 1 : 0

  name = format("%s-subnetwork-public", var.name_prefix)

  project = var.project
  region  = var.region
  network = google_compute_network.vpc.*.self_link[0]

  private_ip_google_access = true
  ip_cidr_range            = cidrsubnet(var.cidr_block, var.cidr_subnetwork_width_delta, 0)

  secondary_ip_range {
    range_name = "public-services"
    ip_cidr_range = cidrsubnet(
      var.secondary_cidr_block,
      var.secondary_cidr_subnetwork_width_delta,
      0
    )
  }

  dynamic "log_config" {
    for_each = var.log_config == null ? [] : list(var.log_config)

    content {
      aggregation_interval = var.log_config.aggregation_interval
      flow_sampling        = var.log_config.flow_sampling
      metadata             = var.log_config.metadata
    }
  }
}

resource "google_compute_router_nat" "vpc_nat" {
  count = var.create_vpc ? 1 : 0

  name = format("%s-nat", var.name_prefix)

  project = var.project
  region  = var.region
  router  = google_compute_router.vpc_router.*.name[0]

  nat_ip_allocate_option = "AUTO_ONLY"

  # "Manually" define the subnetworks for which the NAT is used, so that we can exclude the public subnetwork
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.vpc_subnetwork_public.*.self_link[0]
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Private Subnetwork Config
# ---------------------------------------------------------------------------------------------------------------------

resource "google_compute_subnetwork" "vpc_subnetwork_private" {
  count = var.create_vpc ? 1 : 0

  name = format("%s-subnetwork-private", var.name_prefix)

  project = var.project
  region  = var.region
  network = google_compute_network.vpc.*.self_link[0]

  private_ip_google_access = true
  ip_cidr_range = cidrsubnet(
    var.cidr_block,
    var.cidr_subnetwork_width_delta,
    1 * (1 + var.cidr_subnetwork_spacing)
  )

  secondary_ip_range {
    range_name = "private-services"
    ip_cidr_range = cidrsubnet(
      var.secondary_cidr_block,
      var.secondary_cidr_subnetwork_width_delta,
      1 * (1 + var.secondary_cidr_subnetwork_spacing)
    )
  }

  dynamic "log_config" {
    for_each = var.log_config == null ? [] : list(var.log_config)

    content {
      aggregation_interval = var.log_config.aggregation_interval
      flow_sampling        = var.log_config.flow_sampling
      metadata             = var.log_config.metadata
    }
  }
}
