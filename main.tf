resource "azurerm_logic_app_integration_account_batch_configuration" "logic_app_integration_account_batch_configurations" {
  for_each = var.logic_app_integration_account_batch_configurations

  batch_group_name         = each.value.batch_group_name
  integration_account_name = each.value.integration_account_name
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  metadata                 = each.value.metadata

  release_criteria {
    batch_size    = each.value.release_criteria.batch_size
    message_count = each.value.release_criteria.message_count
    dynamic "recurrence" {
      for_each = each.value.release_criteria.recurrence != null ? [each.value.release_criteria.recurrence] : []
      content {
        end_time  = recurrence.value.end_time
        frequency = recurrence.value.frequency
        interval  = recurrence.value.interval
        dynamic "schedule" {
          for_each = recurrence.value.schedule != null ? [recurrence.value.schedule] : []
          content {
            hours      = schedule.value.hours
            minutes    = schedule.value.minutes
            month_days = schedule.value.month_days
            dynamic "monthly" {
              for_each = schedule.value.monthly != null ? [schedule.value.monthly] : []
              content {
                week    = monthly.value.week
                weekday = monthly.value.weekday
              }
            }
            week_days = schedule.value.week_days
          }
        }
        start_time = recurrence.value.start_time
        time_zone  = recurrence.value.time_zone
      }
    }
  }
}

