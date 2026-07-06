output "data_factories" {
  description = "All data_factory resources"
  value       = azurerm_data_factory.data_factories
}
output "data_factories_customer_managed_key_id" {
  description = "List of customer_managed_key_id values across all data_factories"
  value       = [for k, v in azurerm_data_factory.data_factories : v.customer_managed_key_id]
}
output "data_factories_customer_managed_key_identity_id" {
  description = "List of customer_managed_key_identity_id values across all data_factories"
  value       = [for k, v in azurerm_data_factory.data_factories : v.customer_managed_key_identity_id]
}
output "data_factories_github_configuration" {
  description = "List of github_configuration values across all data_factories"
  value       = [for k, v in azurerm_data_factory.data_factories : v.github_configuration]
}
output "data_factories_global_parameter" {
  description = "List of global_parameter values across all data_factories"
  value       = [for k, v in azurerm_data_factory.data_factories : v.global_parameter]
}
output "data_factories_identity" {
  description = "List of identity values across all data_factories"
  value       = [for k, v in azurerm_data_factory.data_factories : v.identity]
}
output "data_factories_location" {
  description = "List of location values across all data_factories"
  value       = [for k, v in azurerm_data_factory.data_factories : v.location]
}
output "data_factories_managed_virtual_network_enabled" {
  description = "List of managed_virtual_network_enabled values across all data_factories"
  value       = [for k, v in azurerm_data_factory.data_factories : v.managed_virtual_network_enabled]
}
output "data_factories_name" {
  description = "List of name values across all data_factories"
  value       = [for k, v in azurerm_data_factory.data_factories : v.name]
}
output "data_factories_public_network_enabled" {
  description = "List of public_network_enabled values across all data_factories"
  value       = [for k, v in azurerm_data_factory.data_factories : v.public_network_enabled]
}
output "data_factories_purview_id" {
  description = "List of purview_id values across all data_factories"
  value       = [for k, v in azurerm_data_factory.data_factories : v.purview_id]
}
output "data_factories_resource_group_name" {
  description = "List of resource_group_name values across all data_factories"
  value       = [for k, v in azurerm_data_factory.data_factories : v.resource_group_name]
}
output "data_factories_tags" {
  description = "List of tags values across all data_factories"
  value       = [for k, v in azurerm_data_factory.data_factories : v.tags]
}
output "data_factories_vsts_configuration" {
  description = "List of vsts_configuration values across all data_factories"
  value       = [for k, v in azurerm_data_factory.data_factories : v.vsts_configuration]
}

