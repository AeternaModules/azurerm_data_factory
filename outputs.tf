output "data_factories_id" {
  description = "Map of id values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.id if v.id != null && length(v.id) > 0 }
}
output "data_factories_customer_managed_key_id" {
  description = "Map of customer_managed_key_id values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.customer_managed_key_id if v.customer_managed_key_id != null && length(v.customer_managed_key_id) > 0 }
}
output "data_factories_customer_managed_key_identity_id" {
  description = "Map of customer_managed_key_identity_id values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.customer_managed_key_identity_id if v.customer_managed_key_identity_id != null && length(v.customer_managed_key_identity_id) > 0 }
}
output "data_factories_github_configuration" {
  description = "Map of github_configuration values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => one(v.github_configuration) if v.github_configuration != null && length(v.github_configuration) > 0 }
}
output "data_factories_global_parameter" {
  description = "Map of global_parameter values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.global_parameter if v.global_parameter != null && length(v.global_parameter) > 0 }
}
output "data_factories_identity" {
  description = "Map of identity values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => one(v.identity) if v.identity != null && length(v.identity) > 0 }
}
output "data_factories_location" {
  description = "Map of location values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.location if v.location != null && length(v.location) > 0 }
}
output "data_factories_managed_virtual_network_enabled" {
  description = "Map of managed_virtual_network_enabled values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.managed_virtual_network_enabled if v.managed_virtual_network_enabled != null }
}
output "data_factories_name" {
  description = "Map of name values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.name if v.name != null && length(v.name) > 0 }
}
output "data_factories_public_network_enabled" {
  description = "Map of public_network_enabled values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.public_network_enabled if v.public_network_enabled != null }
}
output "data_factories_purview_id" {
  description = "Map of purview_id values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.purview_id if v.purview_id != null && length(v.purview_id) > 0 }
}
output "data_factories_resource_group_name" {
  description = "Map of resource_group_name values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "data_factories_tags" {
  description = "Map of tags values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "data_factories_vsts_configuration" {
  description = "Map of vsts_configuration values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => one(v.vsts_configuration) if v.vsts_configuration != null && length(v.vsts_configuration) > 0 }
}

