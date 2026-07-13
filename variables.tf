variable "logic_app_integration_account_batch_configurations" {
  description = <<EOT
Map of logic_app_integration_account_batch_configurations, attributes below
Required:
    - batch_group_name
    - integration_account_name
    - name
    - resource_group_name
    - release_criteria (block):
        - batch_size (optional)
        - message_count (optional)
        - recurrence (optional, block):
            - end_time (optional)
            - frequency (required)
            - interval (required)
            - schedule (optional, block):
                - hours (optional)
                - minutes (optional)
                - month_days (optional)
                - monthly (optional, block):
                    - week (required)
                    - weekday (required)
                - week_days (optional)
            - start_time (optional)
            - time_zone (optional)
Optional:
    - metadata
EOT

  type = map(object({
    batch_group_name         = string
    integration_account_name = string
    name                     = string
    resource_group_name      = string
    metadata                 = optional(map(string))
    release_criteria = object({
      batch_size    = optional(number)
      message_count = optional(number)
      recurrence = optional(object({
        end_time  = optional(string)
        frequency = string
        interval  = number
        schedule = optional(object({
          hours      = optional(set(number))
          minutes    = optional(set(number))
          month_days = optional(set(number))
          monthly = optional(list(object({
            week    = number
            weekday = string
          })))
          week_days = optional(set(string))
        }))
        start_time = optional(string)
        time_zone  = optional(string)
      }))
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_batch_configurations : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_batch_configurations : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_batch_configurations : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_batch_configurations : (
        v.release_criteria.batch_size == null || (v.release_criteria.batch_size >= 1 && v.release_criteria.batch_size <= 83886080)
      )
    ])
    error_message = "must be between 1 and 83886080"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_batch_configurations : (
        v.release_criteria.message_count == null || (v.release_criteria.message_count >= 1 && v.release_criteria.message_count <= 8000)
      )
    ])
    error_message = "must be between 1 and 8000"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_batch_configurations : (
        v.release_criteria.recurrence == null || (v.release_criteria.recurrence.interval >= 1 && v.release_criteria.recurrence.interval <= 100)
      )
    ])
    error_message = "must be between 1 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_batch_configurations : (
        v.release_criteria.recurrence == null || (v.release_criteria.recurrence.schedule == null || (v.release_criteria.recurrence.schedule.hours == null || (alltrue([for x in v.release_criteria.recurrence.schedule.hours : x >= 0 && x <= 23]))))
      )
    ])
    error_message = "must be between 0 and 23"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_batch_configurations : (
        v.release_criteria.recurrence == null || (v.release_criteria.recurrence.schedule == null || (v.release_criteria.recurrence.schedule.minutes == null || (alltrue([for x in v.release_criteria.recurrence.schedule.minutes : x >= 0 && x <= 59]))))
      )
    ])
    error_message = "must be between 0 and 59"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_batch_configurations : (
        v.metadata == null || (alltrue([for x in v.metadata : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 16 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

