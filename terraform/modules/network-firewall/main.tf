
# ---------------------------------------------------------------------------------------------------------------------
# public - allow ingress from anywhere
# ---------------------------------------------------------------------------------------------------------------------

resource "google_compute_firewall" "public_allow_all_inbound" {
  name = "${var.name_prefix}-public-allow-ingress"

  project = var.project
  network = var.network

  target_tags   = [local.public]
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]

  priority = "1000"

  allow {
    protocol = "all"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# public - allow ingress from specific sources
# ---------------------------------------------------------------------------------------------------------------------

resource "google_compute_firewall" "public_restricted_allow_inbound" {

  count = length(var.allowed_public_restricted_subnetworks) > 0 ? 1 : 0

  name = format("%s-public-restricted-allow-ingress", var.name_prefix)

  project = var.project
  network = var.network

  target_tags   = [local.public_restricted]
  direction     = "INGRESS"
  source_ranges = var.allowed_public_restricted_subnetworks

  priority = "1000"

  allow {
    protocol = "all"
  }
}


# ---------------------------------------------------------------------------------------------------------------------
# private - allow ingress from within this network
# ---------------------------------------------------------------------------------------------------------------------

resource "google_compute_firewall" "private_allow_all_network_inbound" {
  count = var.create_vpc_network ? 1 : 0
  name  = format("%s-private-allow-ingress", var.name_prefix)

  project = var.project
  network = var.network

  target_tags = [local.private]
  direction   = "INGRESS"

  source_ranges = [
    data.google_compute_subnetwork.public_subnetwork.ip_cidr_range,
    data.google_compute_subnetwork.public_subnetwork.secondary_ip_range[0].ip_cidr_range,
    data.google_compute_subnetwork.private_subnetwork.ip_cidr_range,
    data.google_compute_subnetwork.private_subnetwork.secondary_ip_range[0].ip_cidr_range,
  ]

  priority = "1000"

  allow {
    protocol = "all"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# private-persistence - allow ingress from `private` and `private-persistence` instances in this network
# ---------------------------------------------------------------------------------------------------------------------

resource "google_compute_firewall" "private_allow_restricted_network_inbound" {
  count = var.create_vpc_network ? 1 : 0
  name  = format("%s-allow-restricted-inbound", var.name_prefix)

  project = var.project
  network = var.network

  target_tags = [local.private_persistence]
  direction   = "INGRESS"

  # source_tags is implicitly within this network; tags are only applied to instances that rest within the same network
  source_tags = [local.private, local.private_persistence]

  priority = "1000"

  allow {
    protocol = "all"
  }
}
