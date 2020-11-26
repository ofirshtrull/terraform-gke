## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.7 |
| google | ~> 3.43.0 |
| google-beta | ~> 3.43.0 |
| kubernetes | ~> 1.7.0 |

## Providers

| Name | Version |
|------|---------|
| google | ~> 3.43.0 |
| google-beta | ~> 3.43.0 |
| null | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_public\_restricted\_subnetworks | The public networks that is allowed access to the public\_restricted subnetwork of the network | `list(string)` | `[]` | no |
| auto\_repair | Whether the nodes will be automatically repaired. | `bool` | `true` | no |
| auto\_upgrade | Whether the nodes will be automatically upgraded. | `bool` | `true` | no |
| cluster\_name | The name of the Kubernetes cluster. | `string` | n/a | yes |
| cluster\_service\_account\_description | A description of the custom service account used for the GKE cluster. | `string` | `"Example GKE Cluster Service Account managed by Terraform"` | no |
| create\_network | n/a | `bool` | `true` | no |
| credentials | Location of the credentials keyfile. | `string` | n/a | yes |
| disk\_size\_gb | Size of the node's disk. | `number` | n/a | yes |
| disk\_type | n/a | `string` | `"pd-standard"` | no |
| enable\_private\_nodes | Control whether nodes have internal IP addresses only. If enabled, all nodes are given only RFC 1918 private addresses and communicate with the master via private networking. | `bool` | `false` | no |
| enable\_vertical\_pod\_autoscaling | Enable vertical pod autoscaling | `string` | `true` | no |
| environment | The name of the environment. | `string` | n/a | yes |
| initial\_node\_count | The number of nodes to create in this cluster's default node pool. | `number` | n/a | yes |
| kubectl\_config\_path | Path to the kubectl config file. Defaults to $HOME/.kube/config | `string` | `""` | no |
| location | The location (region or zone) of the GKE cluster. | `string` | n/a | yes |
| machine\_type | Type of the node compute engines. | `string` | n/a | yes |
| master\_ipv4\_cidr\_block | The IP range in CIDR notation (size must be /28) to use for the hosted master network. This range will be used for assigning internal IP addresses to the master or set of masters, as well as the ILB VIP. This range must not overlap with any other ranges in use within the cluster's network. | `string` | `"10.5.0.0/28"` | no |
| max\_node\_count | Maximum number of nodes in the NodePool. Must be >= min\_node\_count. | `number` | n/a | yes |
| max\_pods\_per\_node | The maximum number of pods per node in this node pool. | `number` | `55` | no |
| min\_node\_count | Minimum number of nodes in the NodePool. Must be >=0 and <= max\_node\_count. | `number` | n/a | yes |
| name | The name of the cluster. | `string` | n/a | yes |
| node\_max\_surge | The number of additional nodes that can be added to the node pool during an upgrade. | `number` | `1` | no |
| node\_max\_unavailable | The number of nodes that can be simultaneously unavailable during an upgrade. | `number` | `0` | no |
| override\_default\_node\_pool\_service\_account | When true, this will use the service account that is created for use with the default node pool that comes with all GKE clusters | `bool` | `false` | no |
| project\_id | The project ID to host the cluster in. | `string` | n/a | yes |
| region | The region for the network. If the cluster is regional, this must be the same region. Otherwise, it should be the region of the zone. | `string` | n/a | yes |
| service\_account | The service account to run nodes as if not overridden in `node_pools`. The create\_service\_account variable default value (true) will cause a cluster-specific service account to be created. | `string` | n/a | yes |
| vpc\_cidr\_block | The IP address range of the VPC in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27. | `string` | `"10.3.0.0/16"` | no |
| vpc\_secondary\_cidr\_block | The IP address range of the VPC's secondary address range in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27. | `string` | `"10.4.0.0/16"` | no |
| zones | The zones to host the cluster in. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| client\_certificate | Public certificate used by clients to authenticate to the cluster endpoint. |
| client\_key | Private key used by clients to authenticate to the cluster endpoint. |
| cluster\_ca\_certificate | The public certificate that is the root of trust for the cluster. |
| cluster\_endpoint | The IP address of the cluster master. |
| private | The network tag string used for the private access tier |
| private\_persistence | The network tag string used for the private-persistence access tier |
| public | The network tag string used for the public access tier |
| public\_restricted | The string of the public tag |
