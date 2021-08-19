data "azurerm_subscription" "current" {
}

locals {
  # naming convention - builds the bulk of the naming convention for most resources.
  project                  = var.project
  workload                 = var.workload
  current_subscription_id  = data.azurerm_subscription.current.id
  inn_name_convention      = lower("-${var.deployment_environment}-${local.project}") # EG - "-test-srperf"
  location_short           = substr(var.location, 0, 3)
  vm_deployment_initial    = substr(var.deployment_environment, 0, 1)
  resource_group_prefix    = lower("rg-${var.deployment_environment}-${local.workload}")
  vnet_prefix              = lower("vnet-${var.deployment_environment}-${local.workload}-${local.location_short}")
  vnet_virtual_gateway     = lower("vngw-${var.deployment_environment}-${local.workload}-${local.location_short}")
  subnet_prefix            = lower("snet-${var.deployment_environment}-${local.workload}")   # requires adhoc 'type' adding. Such as 'web' for a web tier subnet.
  subnet_suffix            = lower("-${local.location_short}")  # full subnet name interprolation will be - "${local.subnet_prefix}-web-${subnet_suffix}-01"
  public_ip_prefix         = lower("pep-")
  private_endpoint_suffix  = lower("-pep")
  azure_vm_prefix          = lower("avm-${local.vm_deployment_initial}-${local.location_short}-")

  # Tagging
  module_tag   = { "module" = basename(abspath(path.module)) }
  bespoke_tags = var.tags
  tags         = merge(var.tags, local.module_tag, local.bespoke_tags)

   # Role assignment inputs
  role = {
    "Contributor" = var.principals.Contributors,
    "Owner"       = var.principals.Owners,
    "Reader"      = var.principals.Readers,
  }

}

#########################
# Deploy Resource Group #
#########################
resource "azurerm_resource_group" "new_rg" {
  name     = "${local.resource_group_prefix}-01"
  location = var.location
  tags     = local.tags
}


module "roleAssignment" {
  for_each = local.role
  source  = "andrewCluey/role-assignment/azurerm"
  version = "1.0.0"

  role_definition_name = each.key
  scope_id             = azurerm_resource_group.new_rg.id
  principal_ids        = each.value
}