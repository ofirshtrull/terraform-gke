output "sa_emails" {
  value = {
    general = module.service_accounts_general.email
    dns     = module.service_accounts_dns
    loki    = module.service_accounts_loki
    secrets = module.service_accounts_secrets
    vpc     = module.service_accounts_vpc
  }
}
