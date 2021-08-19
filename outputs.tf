
output "resource_name_convention" {
  description = "The standard Innocent Drinks naming structure. "
  value       = local.inn_name_convention
}


output "location_short" {
  description = "The shortened name standard for Azure Regions."
  value       = local.location_short
}

output "vm_deployment_initial" {
  description = "Shortened Deployment environment for VM naming convention."
  value       = local.vm_deployment_initial
}

output "workload" {
  description = "The shortened name of the project. Used in naming conventions."
  value       = local.workload
}


output "resource_group_prefix" {
  description = "The name prefix for resource groups"
  value       = local.resource_group_prefix
}

output "vnet_prefix" {
  description = "The name prefix for new vNETs"
  value       = local.vnet_prefix
}

output "vnet_virtual_gateway" {
  description = "The name prefix for a new vNET Gateway."
  value       = local.vnet_virtual_gateway
}

output "subnet_prefix" {
  description = "The prefix naming convention for Subnets."
  value       = local.subnet_prefix
}

output "subnet_suffix" {
  description = "The suffix naming convention for Subnets."
  value       = local.subnet_suffix
}

output "public_ip_prefix" {
  description = "The prefix for naming Public IP Addresses."
  value       = local.public_ip_prefix
}

output "private_endpoint_suffix" {
  description = "The suffix for naming Private End Points"
  value       = local.private_endpoint_suffix
}

output "azure_vm_prefix" {
  description = "The naming prefix for Azure Virtual Machines. "
  value       = local.azure_vm_prefix
}

  