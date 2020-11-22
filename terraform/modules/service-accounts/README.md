## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.6 |

## Providers

| Name | Version |
|------|---------|
| google | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| billing\_account\_id | If assigning billing role, specificy a billing account (default is to assign at the organizational level). | `string` | `""` | no |
| description | Descriptions of the created service accounts (defaults to no description) | `string` | `""` | no |
| display\_name | Display names of the created service accounts (defaults to 'Terraform-managed service account') | `string` | `"Terraform-managed service account"` | no |
| generate\_keys | Generate keys for service accounts. | `bool` | `false` | no |
| grant\_billing\_role | Grant billing user role. | `bool` | `false` | no |
| grant\_xpn\_roles | Grant roles for shared VPC management. | `bool` | `true` | no |
| names | Names of the service accounts to create. | `list(string)` | `[]` | no |
| org\_id | Id of the organization for org-level roles. | `string` | `""` | no |
| prefix | Prefix applied to service account names. | `string` | `""` | no |
| project\_id | Project id where service account will be created. | `string` | n/a | yes |
| project\_roles | Common roles to apply to all service accounts, project=>role as elements. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| email | Service account email (for single use). |
| emails | Service account emails by name. |
| emails\_list | Service account emails as list. |
| iam\_email | IAM-format service account email (for single use). |
| iam\_emails | IAM-format service account emails by name. |
| iam\_emails\_list | IAM-format service account emails as list. |
| key | Service account key (for single use). |
| keys | Map of service account keys. |
| service\_account | Service account resource (for single use). |
| service\_accounts | Service account resources as list. |
| service\_accounts\_map | Service account resources by name. |
