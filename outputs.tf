output "logic_app_integration_account_batch_configurations" {
  description = "All logic_app_integration_account_batch_configuration resources"
  value       = azurerm_logic_app_integration_account_batch_configuration.logic_app_integration_account_batch_configurations
}
output "logic_app_integration_account_batch_configurations_batch_group_name" {
  description = "List of batch_group_name values across all logic_app_integration_account_batch_configurations"
  value       = [for k, v in azurerm_logic_app_integration_account_batch_configuration.logic_app_integration_account_batch_configurations : v.batch_group_name]
}
output "logic_app_integration_account_batch_configurations_integration_account_name" {
  description = "List of integration_account_name values across all logic_app_integration_account_batch_configurations"
  value       = [for k, v in azurerm_logic_app_integration_account_batch_configuration.logic_app_integration_account_batch_configurations : v.integration_account_name]
}
output "logic_app_integration_account_batch_configurations_metadata" {
  description = "List of metadata values across all logic_app_integration_account_batch_configurations"
  value       = [for k, v in azurerm_logic_app_integration_account_batch_configuration.logic_app_integration_account_batch_configurations : v.metadata]
}
output "logic_app_integration_account_batch_configurations_name" {
  description = "List of name values across all logic_app_integration_account_batch_configurations"
  value       = [for k, v in azurerm_logic_app_integration_account_batch_configuration.logic_app_integration_account_batch_configurations : v.name]
}
output "logic_app_integration_account_batch_configurations_release_criteria" {
  description = "List of release_criteria values across all logic_app_integration_account_batch_configurations"
  value       = [for k, v in azurerm_logic_app_integration_account_batch_configuration.logic_app_integration_account_batch_configurations : v.release_criteria]
}
output "logic_app_integration_account_batch_configurations_resource_group_name" {
  description = "List of resource_group_name values across all logic_app_integration_account_batch_configurations"
  value       = [for k, v in azurerm_logic_app_integration_account_batch_configuration.logic_app_integration_account_batch_configurations : v.resource_group_name]
}

