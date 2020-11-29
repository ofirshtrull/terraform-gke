## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.6 |

## Providers

| Name | Version |
|------|---------|
| google-beta | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| autoscaling\_config | Optional autoscaling configuration. | <pre>object({<br>    min_node_count = number<br>    max_node_count = number<br>  })</pre> | n/a | yes |
| environment | The name of the environment. | `string` | n/a | yes |
| firewall\_tag | Instances in the network must be tagged with the following network tags in order for inbound traffic to be allowed to reach them. All other inbound traffic is denied, including internal traffic<br><br>public - allow inbound traffic from all sources<br>public-restricted - allow inbound traffic from specific subnetworks on the internet<br>private - allow inbound traffic from within this network<br>private-persistence - allow inbound traffic from tagged sources within this network, excluding instances tagged public | `string` | n/a | yes |
| gke\_cluster\_name | The cluster to create the node pool for. Cluster must be present in location provided for zonal clusters. | `string` | n/a | yes |
| initial\_node\_count | The number of nodes to create in this cluster's default node pool. | `number` | `1` | no |
| location | The location (region or zone) of the GKE cluster. | `string` | n/a | yes |
| management\_config | Optional node management configuration. | <pre>object({<br>    auto_repair  = bool<br>    auto_upgrade = bool<br>  })</pre> | <pre>{<br>  "auto_repair": true,<br>  "auto_upgrade": true<br>}</pre> | no |
| max\_pods\_per\_node | The maximum number of pods per node in this node pool. | `number` | `55` | no |
| node\_config\_disk\_size | Size of the node's disk. | `number` | `10` | no |
| node\_config\_disk\_type | Node disk type, defaults to pd-standard. | `string` | `"pd-standard"` | no |
| node\_config\_image\_type | The image type to use for this node. Note that changing the image type will delete and recreate all nodes in the node pool. | `string` | `"COS"` | no |
| node\_config\_labels | Kubernetes labels attached to nodes. | `map(string)` | `{}` | no |
| node\_config\_local\_ssd\_count | Number of local SSDs attached to nodes. | `number` | `0` | no |
| node\_config\_machine\_type | Type of the node compute engines. | `string` | n/a | yes |
| node\_config\_preemptible | A preemptible VM is an instance that you can create and run at a much lower price than normal instances. However, Compute Engine might stop (preempt) | `bool` | `false` | no |
| node\_config\_tags | Network tags applied to nodes. | `list(string)` | n/a | yes |
| node\_pool\_name | The name of the node pool. If left blank, Terraform will auto-generate a unique name. | `string` | n/a | yes |
| node\_pool\_service\_account | The service account to run nodes as. | `string` | n/a | yes |
| project\_id | The project ID to host the cluster in. | `string` | n/a | yes |
| timeouts | Timeouts configuration | `any` | <pre>[<br>  {<br>    "create": "30m",<br>    "delete": "30m",<br>    "update": "30m"<br>  }<br>]</pre> | no |
| upgrade\_config | Optional node upgrade configuration. | <pre>object({<br>    max_surge       = number<br>    max_unavailable = number<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | Nodepool id. |
| name | Nodepool name. |
