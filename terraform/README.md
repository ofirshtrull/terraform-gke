## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.7 |
| google | ~> 3.49.0 |
| google-beta | ~> 3.49.0 |

## Providers

| Name | Version |
|------|---------|
| null | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | The project ID to host the cluster in. | `string` | n/a | yes |
| region | The region for the network. If the cluster is regional, this must be the same region. Otherwise, it should be the region of the zone. | `string` | n/a | yes |

## Outputs

No output.
