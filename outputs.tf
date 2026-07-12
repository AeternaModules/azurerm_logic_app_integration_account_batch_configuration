output "logic_app_integration_account_batch_configurations_id" {
  description = "Map of id values across all logic_app_integration_account_batch_configurations, keyed the same as var.logic_app_integration_account_batch_configurations"
  value       = { for k, v in azurerm_logic_app_integration_account_batch_configuration.logic_app_integration_account_batch_configurations : k => v.id }
}
output "logic_app_integration_account_batch_configurations_batch_group_name" {
  description = "Map of batch_group_name values across all logic_app_integration_account_batch_configurations, keyed the same as var.logic_app_integration_account_batch_configurations"
  value       = { for k, v in azurerm_logic_app_integration_account_batch_configuration.logic_app_integration_account_batch_configurations : k => v.batch_group_name }
}
output "logic_app_integration_account_batch_configurations_integration_account_name" {
  description = "Map of integration_account_name values across all logic_app_integration_account_batch_configurations, keyed the same as var.logic_app_integration_account_batch_configurations"
  value       = { for k, v in azurerm_logic_app_integration_account_batch_configuration.logic_app_integration_account_batch_configurations : k => v.integration_account_name }
}
output "logic_app_integration_account_batch_configurations_metadata" {
  description = "Map of metadata values across all logic_app_integration_account_batch_configurations, keyed the same as var.logic_app_integration_account_batch_configurations"
  value       = { for k, v in azurerm_logic_app_integration_account_batch_configuration.logic_app_integration_account_batch_configurations : k => v.metadata }
}
output "logic_app_integration_account_batch_configurations_name" {
  description = "Map of name values across all logic_app_integration_account_batch_configurations, keyed the same as var.logic_app_integration_account_batch_configurations"
  value       = { for k, v in azurerm_logic_app_integration_account_batch_configuration.logic_app_integration_account_batch_configurations : k => v.name }
}
output "logic_app_integration_account_batch_configurations_release_criteria" {
  description = "Map of release_criteria values across all logic_app_integration_account_batch_configurations, keyed the same as var.logic_app_integration_account_batch_configurations"
  value       = { for k, v in azurerm_logic_app_integration_account_batch_configuration.logic_app_integration_account_batch_configurations : k => v.release_criteria }
}
output "logic_app_integration_account_batch_configurations_resource_group_name" {
  description = "Map of resource_group_name values across all logic_app_integration_account_batch_configurations, keyed the same as var.logic_app_integration_account_batch_configurations"
  value       = { for k, v in azurerm_logic_app_integration_account_batch_configuration.logic_app_integration_account_batch_configurations : k => v.resource_group_name }
}

