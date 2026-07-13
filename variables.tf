variable "data_factories" {
  description = <<EOT
Map of data_factories, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - customer_managed_key_id
    - customer_managed_key_identity_id
    - managed_virtual_network_enabled
    - public_network_enabled
    - purview_id
    - tags
    - github_configuration (block):
        - account_name (required)
        - branch_name (required)
        - git_url (optional)
        - publishing_enabled (optional)
        - repository_name (required)
        - root_folder (required)
    - global_parameter (block):
        - name (required)
        - type (required)
        - value (required)
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - vsts_configuration (block):
        - account_name (required)
        - branch_name (required)
        - project_name (required)
        - publishing_enabled (optional)
        - repository_name (required)
        - root_folder (required)
        - tenant_id (required)
EOT

  type = map(object({
    location                         = string
    name                             = string
    resource_group_name              = string
    customer_managed_key_id          = optional(string)
    customer_managed_key_identity_id = optional(string)
    managed_virtual_network_enabled  = optional(bool)
    public_network_enabled           = optional(bool)
    purview_id                       = optional(string)
    tags                             = optional(map(string))
    github_configuration = optional(object({
      account_name       = string
      branch_name        = string
      git_url            = optional(string)
      publishing_enabled = optional(bool)
      repository_name    = string
      root_folder        = string
    }))
    global_parameter = optional(list(object({
      name  = string
      type  = string
      value = string
    })))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    vsts_configuration = optional(object({
      account_name       = string
      branch_name        = string
      project_name       = string
      publishing_enabled = optional(bool)
      repository_name    = string
      root_folder        = string
      tenant_id          = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        v.github_configuration == null || (length(v.github_configuration.account_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        v.github_configuration == null || (length(v.github_configuration.branch_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        v.github_configuration == null || (length(v.github_configuration.repository_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        v.github_configuration == null || (length(v.github_configuration.root_folder) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        v.vsts_configuration == null || (length(v.vsts_configuration.account_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        v.vsts_configuration == null || (length(v.vsts_configuration.branch_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        v.vsts_configuration == null || (length(v.vsts_configuration.project_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        v.vsts_configuration == null || (length(v.vsts_configuration.repository_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        v.vsts_configuration == null || (length(v.vsts_configuration.root_folder) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        v.vsts_configuration == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.vsts_configuration.tenant_id)))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        v.global_parameter == null || alltrue([for item in v.global_parameter : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        v.global_parameter == null || alltrue([for item in v.global_parameter : (length(item.value) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 16 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

