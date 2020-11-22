locals {
  account_billing       = var.grant_billing_role && var.billing_account_id != ""
  org_billing           = var.grant_billing_role && var.billing_account_id == "" && var.org_id != ""
  prefix                = var.prefix != "" ? format("%s-", var.prefix) : ""
  xpn                   = var.grant_xpn_roles && var.org_id != ""
  service_accounts_list = [for name in var.names : google_service_account.service_accounts[name]]
  emails_list           = [for account in local.service_accounts_list : account.email]
  iam_emails_list       = [for email in local.emails_list : format("serviceAccount:%s", email)]
  names                 = toset(var.names)
  name_role_pairs       = setproduct(local.names, toset(var.project_roles))
  project_roles_map_data = zipmap(
    [for pair in local.name_role_pairs : format("%s-%s", pair[0], pair[1])],
    [for pair in local.name_role_pairs : {
      name = pair[0]
      role = pair[1]
    }]
  )
}
