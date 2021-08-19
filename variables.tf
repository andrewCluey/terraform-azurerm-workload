variable "project" {
  type        = string
  description = "description"
  default     = "srperf"
}

variable "workload" {
  type        = string
  description = "A 'shortened' name of the Project. limited to 5 characters. Such as 'shs' or 'srperf'"
  default     = "wtest"
  validation {
    condition = (length(var.workload) <=5)
    error_message = "Workload input variable must be less than 5 characters."
  }
}


variable "deployment_environment" {
  type        = string
  description = "The validated name of the deployment environment. See README."
  default     = "Dev"
  validation {
    condition = var.deployment_environment == "Prod" || var.deployment_environment == "PreProd" || var.deployment_environment == "Test" || var.deployment_environment == "Dev" || var.deployment_environment == "Plat" || var.deployment_environment == "PlatDR" || var.deployment_environment == "Sandpit" || var.deployment_environment == "DR" || var.deployment_environment == "E2E" || var.deployment_environment == "SIT" || var.deployment_environment == "MAN"
    error_message = "The assigned deployment environment name must be one of either Plat; Platdr; Prod; DR; PreProd; TEST; E2E; SIT; MAN; DEV."
  }
}

variable "tags" {
  type        = map
  description = "description"
  default     = {}
}


variable "location" {
  type        = string
  description = "The Azure Region to deploy to."
  default     = "uksouth"
}


variable "principals" {
  type        = any
  description = "A map of Roles (Owner; Contributor & Reader) to Principal IDs to assign to the Resource Group."
}
