

# create service accounts
resource "google_service_account" "service_accounts" {
  for_each     = local.names
  account_id   = format("%s%s", local.prefix, lower(each.value))
  display_name = var.display_name
  description  = var.description
  project      = var.project_id
}

# common roles
resource "google_project_iam_member" "project-roles" {
  for_each = local.project_roles_map_data

  project = element(
    split(
      "=>",
      each.value.role
    ),
    0,
  )

  role = element(
    split(
      "=>",
      each.value.role
    ),
    1,
  )

  member = format("serviceAccount:%s", google_service_account.service_accounts[each.value.name].email)
}

# conditionally assign billing user role at the org level
resource "google_organization_iam_member" "billing_user" {
  for_each = local.org_billing ? local.names : toset([])
  org_id   = var.org_id
  role     = "roles/billing.user"
  member   = format("serviceAccount:%s", google_service_account.service_accounts[each.value].email)
}

# conditionally assign billing user role on a specific billing account
resource "google_billing_account_iam_member" "billing_user" {
  for_each           = local.account_billing ? local.names : toset([])
  billing_account_id = var.billing_account_id
  role               = "roles/billing.user"
  member             = format("serviceAccount:%s", google_service_account.service_accounts[each.value].email)
}

# conditionally assign roles for shared VPC
# ref: https://cloud.google.com/vpc/docs/shared-vpc

resource "google_organization_iam_member" "xpn_admin" {
  for_each = local.xpn ? local.names : toset([])
  org_id   = var.org_id
  role     = "roles/compute.xpnAdmin"
  member   = format("serviceAccount:%s", google_service_account.service_accounts[each.value].email)
}

resource "google_organization_iam_member" "organization_viewer" {
  for_each = local.xpn ? local.names : toset([])
  org_id   = var.org_id
  role     = "roles/resourcemanager.organizationViewer"
  member   = format("serviceAccount:%s", google_service_account.service_accounts[each.value].email)
}

# keys
resource "google_service_account_key" "keys" {
  for_each           = var.generate_keys ? local.names : toset([])
  service_account_id = google_service_account.service_accounts[each.value].email
}
