## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.7 |

## Providers

| Name | Version |
|------|---------|
| google | n/a |
| google-beta | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alternative\_default\_service\_account | Alternative Service Account to be used by the Node VMs. If not specified, the default compute Service Account will be used. Provide if the default Service Account is no longer available. | `string` | `null` | no |
| basic\_auth\_password | The password used for basic auth; set both this and `basic_auth_username` to "" to disable basic auth. | `string` | `""` | no |
| basic\_auth\_username | The username used for basic auth; set both this and `basic_auth_password` to "" to disable basic auth. | `string` | `""` | no |
| cluster\_secondary\_range\_name | The name of the secondary range within the subnetwork for the cluster to use | `string` | n/a | yes |
| description | The description of the cluster | `string` | `""` | no |
| disable\_public\_endpoint | Control whether the master's internal IP address is used as the cluster endpoint. If set to 'true', the master can only be accessed from internal IP addresses. | `bool` | `false` | no |
| enable\_client\_certificate\_authentication | Whether to enable authentication by x509 certificates. With ABAC disabled, these certificates are effectively useless. | `bool` | `false` | no |
| enable\_legacy\_abac | Whether to enable legacy Attribute-Based Access Control (ABAC). RBAC has significant security advantages over ABAC. | `bool` | `false` | no |
| enable\_network\_policy | Whether to enable Kubernetes NetworkPolicy on the master, which is required to be enabled to be used on Nodes. | `bool` | `true` | no |
| enable\_private\_nodes | Control whether nodes have internal IP addresses only. If enabled, all nodes are given only RFC 1918 private addresses and communicate with the master via private networking. | `bool` | `false` | no |
| enable\_vertical\_pod\_autoscaling | Whether to enable Vertical Pod Autoscaling | `string` | `false` | no |
| gsuite\_domain\_name | The domain name for use with Google security groups in Kubernetes RBAC. If a value is provided, the cluster will be initialized with security group `gke-security-groups@[yourdomain.com]`. | `string` | `null` | no |
| horizontal\_pod\_autoscaling | Whether to enable the horizontal pod autoscaling addon | `bool` | `true` | no |
| http\_load\_balancing | Whether to enable the http (L7) load balancing addon | `bool` | `true` | no |
| ip\_masq\_link\_local | Whether to masquerade traffic to the link-local prefix (169.254.0.0/16). | `bool` | `false` | no |
| ip\_masq\_resync\_interval | The interval at which the agent attempts to sync its ConfigMap file from the disk. | `string` | `"60s"` | no |
| kubernetes\_version | The Kubernetes version of the masters. If set to 'latest' it will pull latest available version in the selected region. | `string` | `"latest"` | no |
| location | The location (region or zone) to host the cluster in | `string` | n/a | yes |
| logging\_service | The logging service that the cluster should write logs to. Available options include logging.googleapis.com/kubernetes, logging.googleapis.com (legacy), and none | `string` | `"logging.googleapis.com/kubernetes"` | no |
| maintenance\_start\_time | Time window specified for daily maintenance operations in RFC3339 format | `string` | `"05:00"` | no |
| master\_authorized\_networks\_config | The desired configuration options for master authorized networks. Omit the nested cidr\_blocks attribute to disallow external access (except the cluster node IPs, which GKE automatically whitelists)<br>  ### example format ###<br>  master\_authorized\_networks\_config = [{<br>    cidr\_blocks = [{<br>      cidr\_block   = "10.0.0.0/8"<br>      display\_name = "example\_network"<br>    }],<br>  }] | `list(any)` | `[]` | no |
| master\_ipv4\_cidr\_block | The IP range in CIDR notation to use for the hosted master network. This range will be used for assigning internal IP addresses to the master or set of masters, as well as the ILB VIP. This range must not overlap with any other ranges in use within the cluster's network. | `string` | `""` | no |
| monitoring\_service | The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Stackdriver Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting. Available options include monitoring.googleapis.com/kubernetes, monitoring.googleapis.com (legacy), and none | `string` | `"monitoring.googleapis.com/kubernetes"` | no |
| name | The name of the cluster | `string` | n/a | yes |
| network | A reference (self link) to the VPC network to host the cluster in | `string` | n/a | yes |
| network\_project | The project ID of the shared VPC's host (for shared vpc support) | `string` | `""` | no |
| non\_masquerade\_cidrs | List of strings in CIDR notation that specify the IP address ranges that do not use IP masquerading. | `list(string)` | <pre>[<br>  "10.0.0.0/8",<br>  "172.16.0.0/12",<br>  "192.168.0.0/16"<br>]</pre> | no |
| project | The project ID to host the cluster in | `string` | n/a | yes |
| resource\_labels | The GCE resource labels (a map of key/value pairs) to be applied to the cluster. | `map` | `{}` | no |
| secrets\_encryption\_kms\_key | The Cloud KMS key to use for the encryption of secrets in etcd, e.g: projects/my-project/locations/global/keyRings/my-ring/cryptoKeys/my-key | `string` | `null` | no |
| services\_secondary\_range\_name | The name of the secondary range within the subnetwork for the services to use | `string` | `null` | no |
| stub\_domains | Map of stub domains and their resolvers to forward DNS queries for a certain domain to an external DNS server | `map(string)` | `{}` | no |
| subnetwork | A reference (self link) to the subnetwork to host the cluster in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| client\_certificate | Public certificate used by clients to authenticate to the cluster endpoint. |
| client\_key | Private key used by clients to authenticate to the cluster endpoint. |
| cluster\_ca\_certificate | The public certificate that is the root of trust for the cluster. |
| endpoint | The IP address of the cluster master. |
| master\_version | The Kubernetes master version. |
| name | The name of the cluster master. This output is used for interpolation with node pools, other modules. |
