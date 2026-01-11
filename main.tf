resource "azurerm_data_factory" "data_factorys" {
  for_each = var.data_factorys

  location                         = each.value.location
  name                             = each.value.name
  resource_group_name              = each.value.resource_group_name
  customer_managed_key_id          = each.value.customer_managed_key_id
  customer_managed_key_identity_id = each.value.customer_managed_key_identity_id
  managed_virtual_network_enabled  = each.value.managed_virtual_network_enabled
  public_network_enabled           = each.value.public_network_enabled
  purview_id                       = each.value.purview_id
  tags                             = each.value.tags

  dynamic "github_configuration" {
    for_each = each.value.github_configuration != null ? [each.value.github_configuration] : []
    content {
      account_name       = github_configuration.value.account_name
      branch_name        = github_configuration.value.branch_name
      git_url            = github_configuration.value.git_url
      publishing_enabled = github_configuration.value.publishing_enabled
      repository_name    = github_configuration.value.repository_name
      root_folder        = github_configuration.value.root_folder
    }
  }

  dynamic "global_parameter" {
    for_each = each.value.global_parameter != null ? [each.value.global_parameter] : []
    content {
      name  = global_parameter.value.name
      type  = global_parameter.value.type
      value = global_parameter.value.value
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "vsts_configuration" {
    for_each = each.value.vsts_configuration != null ? [each.value.vsts_configuration] : []
    content {
      account_name       = vsts_configuration.value.account_name
      branch_name        = vsts_configuration.value.branch_name
      project_name       = vsts_configuration.value.project_name
      publishing_enabled = vsts_configuration.value.publishing_enabled
      repository_name    = vsts_configuration.value.repository_name
      root_folder        = vsts_configuration.value.root_folder
      tenant_id          = vsts_configuration.value.tenant_id
    }
  }
}

