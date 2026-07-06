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
    public_network_enabled           = optional(bool) # Default: true
    purview_id                       = optional(string)
    tags                             = optional(map(string))
    github_configuration = optional(object({
      account_name       = string
      branch_name        = string
      git_url            = optional(string)
      publishing_enabled = optional(bool) # Default: true
      repository_name    = string
      root_folder        = string
    }))
    global_parameter = optional(object({
      name  = string
      type  = string
      value = string
    }))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    vsts_configuration = optional(object({
      account_name       = string
      branch_name        = string
      project_name       = string
      publishing_enabled = optional(bool) # Default: true
      repository_name    = string
      root_folder        = string
      tenant_id          = string
    }))
  }))
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
        v.global_parameter == null || (length(v.global_parameter.name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_factories : (
        v.global_parameter == null || (length(v.global_parameter.value) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_data_factory's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.DataFactoryName] !regexp.MustCompile(`^[A-Za-z0-9]+(?:-[A-Za-z0-9]+)*$`).MatchString(value)
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
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
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: global_parameter.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: purview_id
  #   source:    [from account.ValidateAccountID] !ok
  # path: purview_id
  #   source:    [from account.ValidateAccountID] err != nil
  # path: customer_managed_key_id
  #   source:    [from keyvault.ValidateNestedItemID] !ok
  # path: customer_managed_key_id
  #   source:    [from keyvault.ValidateNestedItemID] err != nil
  # path: customer_managed_key_identity_id
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: customer_managed_key_identity_id
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

