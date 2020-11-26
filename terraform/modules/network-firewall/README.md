## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.7 |

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_public\_restricted\_subnetworks | The public networks that is allowed access to the public\_restricted subnetwork of the network | `list(string)` | `[]` | no |
| create\_vpc\_network | Create or not a vpc. | `bool` | `true` | no |
| name\_prefix | A name prefix used in resource names to ensure uniqueness across a project. | `string` | n/a | yes |
| network | A reference (self\_link) to the VPC network to apply firewall rules to | `string` | n/a | yes |
| private\_subnetwork | A reference (self\_link) to the private subnetwork of the network | `string` | n/a | yes |
| project | The project to create the firewall rules in. Must match the network project. | `string` | n/a | yes |
| public\_subnetwork | A reference (self\_link) to the public subnetwork of the network | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| private | The string of the private tag |
| private\_persistence | The string of the private-persistence tag |
| public | The string of the public tag |
| public\_restricted | The string of the public tag |
