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
  # --- Unconfirmed validation candidates, derived from azurerm_logic_app_integration_account_batch_configuration's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.IntegrationAccountBatchConfigurationName] !ok
  # path: name
  #   condition: length(value) <= 20
  #   message:   [from validate.IntegrationAccountBatchConfigurationName: invalid when len(value) > 20]
  #   source:    [from validate.IntegrationAccountBatchConfigurationName: invalid when len(value) > 20]
  # path: name
  #   source:    [from validate.IntegrationAccountBatchConfigurationName] !regexp.MustCompile(`^[A-Za-z0-9]+$`).MatchString(v)
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: integration_account_name
  #   source:    validate.IntegrationAccountName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: batch_group_name
  #   source:    [from validate.IntegrationAccountBatchConfigurationBatchGroupName] !ok
  # path: batch_group_name
  #   condition: length(value) <= 80
  #   message:   [from validate.IntegrationAccountBatchConfigurationBatchGroupName: invalid when len(value) > 80]
  #   source:    [from validate.IntegrationAccountBatchConfigurationBatchGroupName: invalid when len(value) > 80]
  # path: batch_group_name
  #   source:    [from validate.IntegrationAccountBatchConfigurationBatchGroupName] !regexp.MustCompile(`^[A-Za-z0-9-_().]+$`).MatchString(v)
  # path: release_criteria.batch_size
  #   condition: value >= 1 && value <= 83886080
  #   message:   must be between 1 and 83886080
  # path: release_criteria.message_count
  #   condition: value >= 1 && value <= 8000
  #   message:   must be between 1 and 8000
  # path: release_criteria.recurrence.frequency
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: release_criteria.recurrence.interval
  #   condition: value >= 1 && value <= 100
  #   message:   must be between 1 and 100
  # path: release_criteria.recurrence.end_time
  #   source:    validation.IsRFC3339Time(...) - no translation rule yet, add one
  # path: release_criteria.recurrence.schedule.hours[*]
  #   condition: value >= 0 && value <= 23
  #   message:   must be between 0 and 23
  # path: release_criteria.recurrence.schedule.minutes[*]
  #   condition: value >= 0 && value <= 59
  #   message:   must be between 0 and 59
  # path: release_criteria.recurrence.schedule.month_days[*]
  #   source:    validation.All(...) - no translation rule yet, add one
  # path: release_criteria.recurrence.schedule.monthly.weekday
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: release_criteria.recurrence.schedule.monthly.week
  #   source:    validation.All(...) - no translation rule yet, add one
  # path: release_criteria.recurrence.schedule.week_days[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: release_criteria.recurrence.start_time
  #   source:    validation.IsRFC3339Time(...) - no translation rule yet, add one
  # path: release_criteria.recurrence.time_zone
  #   source:    validate.BatchConfigurationRecurrenceTimeZone: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: metadata[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
}

