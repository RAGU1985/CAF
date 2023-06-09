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
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/2.67/docs/resources/network_security_group) | resource |
| [azurerm_subnet_network_security_group_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/2.67/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_application_security_group.dest](https://registry.terraform.io/providers/hashicorp/azurerm/2.67/docs/data-sources/application_security_group) | data source |
| [azurerm_application_security_group.src](https://registry.terraform.io/providers/hashicorp/azurerm/2.67/docs/data-sources/application_security_group) | data source |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/2.67/docs/data-sources/resource_group) | data source |

#### Inputs

| Name | Description | Type |
|------|-------------|------|
| <a name="input_ackey"></a> [ackey](#input_ackey) | Not required if MSI is used to authenticate to the SA where state file is | `any` |
| <a name="input_client_id"></a> [client_id](#input_client_id) | Azure service principal application Id | `any` |
| <a name="input_client_secret"></a> [client_secret](#input_client_secret) | Azure service principal application Secret | `any` |
| <a name="input_network_security_groups"></a> [network_security_groups](#input_network_security_groups) | The network security groups with their properties. | <pre>map(object({<br>    name                      = string<br>    tags                      = map(string)<br>    # subnet_name               = string<br>    # vnet_name                 = string<br>    # networking_resource_group = string<br>    subnet_ids					= list(string)<br>    security_rules = list(object({<br>      name                                         = string<br>      description                                  = string<br>      protocol                                     = string<br>      direction                                    = string<br>      access                                       = string<br>      priority                                     = number<br>      source_address_prefix                        = string<br>      source_address_prefixes                      = list(string)<br>      destination_address_prefix                   = string<br>      destination_address_prefixes                 = list(string)<br>      source_port_range                            = string<br>      source_port_ranges                           = list(string)<br>      destination_port_range                       = string<br>      destination_port_ranges                      = list(string)<br>      source_application_security_group_names      = list(string)<br>      destination_application_security_group_names = list(string)<br>    }))<br>  }))</pre> |
| <a name="input_nsg_additional_tags"></a> [nsg_additional_tags](#input_nsg_additional_tags) | Additional Network Security Group resources tags, in addition to the resource group tags. | `map(string)` |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | The name of the resource group in which to create the NSGs. | `string` |
| <a name="input_subscription_id"></a> [subscription_id](#input_subscription_id) | Azure subscription Id. | `any` |
| <a name="input_tenant_id"></a> [tenant_id](#input_tenant_id) | Azure tenant Id. | `any` |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_security_group_ids"></a> [network_security_group_ids](#output_network_security_group_ids) | n/a |
| <a name="output_nsg_id_map"></a> [nsg_id_map](#output_nsg_id_map) | n/a |
