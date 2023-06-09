#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm) | =2.67 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider_azurerm) | =2.67 |

#### Modules

No modules.

#### Resources

| Name | Type |
|------|------|
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/2.67/docs/resources/subnet) | resource |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/2.67/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.destination_to_source](https://registry.terraform.io/providers/hashicorp/azurerm/2.67/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.source_to_destination](https://registry.terraform.io/providers/hashicorp/azurerm/2.67/docs/resources/virtual_network_peering) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/2.67/docs/data-sources/resource_group) | data source |
| [azurerm_virtual_network.destination](https://registry.terraform.io/providers/hashicorp/azurerm/2.67/docs/data-sources/virtual_network) | data source |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/2.67/docs/data-sources/virtual_network) | data source |

#### Inputs

| Name | Description | Type |
|------|-------------|------|
| <a name="input_ackey"></a> [ackey](#input_ackey) | Not required if MSI is used to authenticate to the SA where state file is | `any` |
| <a name="input_client_id"></a> [client_id](#input_client_id) | Azure service principal application Id | `any` |
| <a name="input_client_secret"></a> [client_secret](#input_client_secret) | Azure service principal application Secret | `any` |
| <a name="input_net_additional_tags"></a> [net_additional_tags](#input_net_additional_tags) | Additional Network resources tags, in addition to the resource group tags. | `map(string)` |
| <a name="input_net_location"></a> [net_location](#input_net_location) | Network resources location if different than the resource group's location. | `string` |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Specifies the name of the resource group in which to create the Azure Network Base Infrastructure Resources. | `string` |
| <a name="input_subnets"></a> [subnets](#input_subnets) | The virtal networks subnets with their properties. | <pre>map(object({<br>    name              = string<br>    vnet_key          = string<br>    vnet_name         = string<br>    address_prefixes  = list(string)<br>    pe_enable         = bool<br>    service_endpoints = list(string)<br>    delegation = list(object({<br>      name = string<br>      service_delegation = list(object({<br>        name    = string<br>        actions = list(string)<br>      }))<br>    }))<br>  }))</pre> |
| <a name="input_subscription_id"></a> [subscription_id](#input_subscription_id) | Azure subscription Id. | `any` |
| <a name="input_tenant_id"></a> [tenant_id](#input_tenant_id) | Azure tenant Id. | `any` |
| <a name="input_virtual_networks"></a> [virtual_networks](#input_virtual_networks) | The virtal networks with their properties. | <pre>map(object({<br>    name          = string<br>    address_space = list(string)<br>    dns_servers   = list(string)<br>    ddos_protection_plan = object({<br>      id     = string<br>      enable = bool<br>    })<br>  }))</pre> |
| <a name="input_vnet_peering"></a> [vnet_peering](#input_vnet_peering) | Vnet Peering to the destination Vnet | <pre>map(object({<br>    destination_vnet_name        = string<br>    destination_vnet_rg          = string<br>    vnet_key                     = string<br>    allow_virtual_network_access = bool<br>    allow_forwarded_traffic      = bool<br>    allow_gateway_transit        = bool<br>    use_remote_gateways          = bool<br>  }))</pre> |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_map_subnet_ids"></a> [map_subnet_ids](#output_map_subnet_ids) | n/a |
| <a name="output_map_subnets"></a> [map_subnets](#output_map_subnets) | n/a |
| <a name="output_map_subnets_serviceendpoints"></a> [map_subnets_serviceendpoints](#output_map_subnets_serviceendpoints) | n/a |
| <a name="output_map_vnet_ids"></a> [map_vnet_ids](#output_map_vnet_ids) | n/a |
| <a name="output_map_vnets"></a> [map_vnets](#output_map_vnets) | n/a |
| <a name="output_private_endpoint_subnets"></a> [private_endpoint_subnets](#output_private_endpoint_subnets) | n/a |
| <a name="output_private_endpoint_vnets"></a> [private_endpoint_vnets](#output_private_endpoint_vnets) | n/a |
| <a name="output_subnet_ids"></a> [subnet_ids](#output_subnet_ids) | Subnets |
| <a name="output_subnets_with_serviceendpoints"></a> [subnets_with_serviceendpoints](#output_subnets_with_serviceendpoints) | n/a |
| <a name="output_vnet_ids"></a> [vnet_ids](#output_vnet_ids) | n/a |
| <a name="output_vnet_locations"></a> [vnet_locations](#output_vnet_locations) | n/a |
| <a name="output_vnet_names"></a> [vnet_names](#output_vnet_names) | n/a |
| <a name="output_vnet_peering_dest_to_source"></a> [vnet_peering_dest_to_source](#output_vnet_peering_dest_to_source) | n/a |
| <a name="output_vnet_peering_source_to_dest"></a> [vnet_peering_source_to_dest](#output_vnet_peering_source_to_dest) | VNet Peering |
| <a name="output_vnet_rgnames"></a> [vnet_rgnames](#output_vnet_rgnames) | n/a |
| <a name="output_vnets"></a> [vnets](#output_vnets) | VNets |
