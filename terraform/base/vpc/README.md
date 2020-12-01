## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_public\_restricted\_subnetworks | The public networks that is allowed access to the public\_restricted subnetwork of the network | `list(string)` | `[]` | no |
| cluster\_name | The name of the Kubernetes cluster. | `string` | n/a | yes |
| create\_network | n/a | `bool` | `true` | no |
| environment | The name of the environment. | `string` | n/a | yes |
| project\_id | The project ID to host the cluster in. | `string` | n/a | yes |
| region | The region for the network. If the cluster is regional, this must be the same region. Otherwise, it should be the region of the zone. | `string` | n/a | yes |
| vpc\_cidr\_block | The IP address range of the VPC in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27. | `string` | `"10.3.0.0/16"` | no |
| vpc\_secondary\_cidr\_block | The IP address range of the VPC's secondary address range in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27. | `string` | `"10.4.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| network | n/a |
| private | The network tag string used for the private access tier |
| private\_persistence | The network tag string used for the private-persistence access tier |
| public | The network tag string used for the public access tier |
| public\_restricted | The string of the public tag |
| public\_subnetwork | n/a |
| public\_subnetwork\_secondary\_range\_name | n/a |
