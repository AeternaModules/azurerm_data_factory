variable "data_factorys" {
  description = <<EOT
Map of data_factorys, attributes below
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
    public_network_enabled           = optional(bool, true)
    purview_id                       = optional(string)
    tags                             = optional(map(string))
    github_configuration = optional(object({
      account_name       = string
      branch_name        = string
      git_url            = optional(string)
      publishing_enabled = optional(bool, true)
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
      publishing_enabled = optional(bool, true)
      repository_name    = string
      root_folder        = string
      tenant_id          = string
    }))
  }))
}

