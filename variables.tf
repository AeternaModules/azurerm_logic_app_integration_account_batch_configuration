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
          monthly = optional(object({
            week    = number
            weekday = string
          }))
          week_days = optional(set(string))
        }))
        start_time = optional(string)
        time_zone  = optional(string)
      }))
    })
  }))
}

