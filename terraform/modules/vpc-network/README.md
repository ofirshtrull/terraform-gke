## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_public\_restricted\_subnetworks | The public networks that is allowed access to the public\_restricted subnetwork of the network | `list(string)` | `[]` | no |
| cidr\_block | The IP address range of the VPC in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27. | `string` | `"10.0.0.0/16"` | no |
| cidr\_subnetwork\_spacing | How many subnetwork-mask sized spaces to leave between each subnetwork type. | `number` | `0` | no |
| cidr\_subnetwork\_width\_delta | The difference between your network and subnetwork netmask; an /16 network and a /20 subnetwork would be 4. | `number` | `4` | no |
| log\_config | The logging options for the subnetwork flow logs. Setting this value to `null` will disable them. See https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html for more information and examples. | <pre>object({<br>    aggregation_interval = string<br>    flow_sampling        = number<br>    metadata             = string<br>  })</pre> | <pre>{<br>  "aggregation_interval": "INTERVAL_10_MIN",<br>  "flow_sampling": 0.5,<br>  "metadata": "INCLUDE_ALL_METADATA"<br>}</pre> | no |
| name\_prefix | A name prefix used in resource names to ensure uniqueness across a project. | `string` | n/a | yes |
| project | The project ID for the network | `string` | n/a | yes |
| region | The region for subnetworks in the network | `string` | n/a | yes |
| secondary\_cidr\_block | The IP address range of the VPC's secondary address range in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27. | `string` | `"10.1.0.0/16"` | no |
| secondary\_cidr\_subnetwork\_spacing | How many subnetwork-mask sized spaces to leave between each subnetwork type's secondary ranges. | `number` | `0` | no |
| secondary\_cidr\_subnetwork\_width\_delta | The difference between your network and subnetwork's secondary range netmask; an /16 network and a /20 subnetwork would be 4. | `number` | `4` | no |

## Outputs

| Name | Description |
|------|-------------|
| network | A reference (self\_link) to the VPC network |
| private\_subnetwork | A reference (self\_link) to the private subnetwork |
| private\_subnetwork\_cidr\_block | n/a |
| private\_subnetwork\_gateway | n/a |
| private\_subnetwork\_name | Name of the private subnetwork |
| private\_subnetwork\_secondary\_cidr\_block | n/a |
| private\_subnetwork\_secondary\_range\_name | n/a |
| public\_subnetwork | A reference (self\_link) to the public subnetwork |
| public\_subnetwork\_cidr\_block | n/a |
| public\_subnetwork\_gateway | n/a |
| public\_subnetwork\_name | Name of the public subnetwork |
| public\_subnetwork\_secondary\_cidr\_block | n/a |
| public\_subnetwork\_secondary\_range\_name | n/a |
