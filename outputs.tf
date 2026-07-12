output "data_factories_customer_managed_key_id" {
  description = "Map of customer_managed_key_id values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.customer_managed_key_id }
}
output "data_factories_customer_managed_key_identity_id" {
  description = "Map of customer_managed_key_identity_id values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.customer_managed_key_identity_id }
}
output "data_factories_github_configuration" {
  description = "Map of github_configuration values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.github_configuration }
}
output "data_factories_global_parameter" {
  description = "Map of global_parameter values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.global_parameter }
}
output "data_factories_identity" {
  description = "Map of identity values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.identity }
}
output "data_factories_location" {
  description = "Map of location values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.location }
}
output "data_factories_managed_virtual_network_enabled" {
  description = "Map of managed_virtual_network_enabled values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.managed_virtual_network_enabled }
}
output "data_factories_name" {
  description = "Map of name values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.name }
}
output "data_factories_public_network_enabled" {
  description = "Map of public_network_enabled values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.public_network_enabled }
}
output "data_factories_purview_id" {
  description = "Map of purview_id values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.purview_id }
}
output "data_factories_resource_group_name" {
  description = "Map of resource_group_name values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.resource_group_name }
}
output "data_factories_tags" {
  description = "Map of tags values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.tags }
}
output "data_factories_vsts_configuration" {
  description = "Map of vsts_configuration values across all data_factories, keyed the same as var.data_factories"
  value       = { for k, v in azurerm_data_factory.data_factories : k => v.vsts_configuration }
}

