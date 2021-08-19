provider "azurerm" {
  features {}
}

module "rg_test" {
  source = "../"

  location               = "uksouth"
  project                = "Test Deployment"
  workload               = "DTest"
  deployment_environment = "Dev"

  principals = {
    "Owners"       = ["a56e4ff4-8376"]
    "Contributors" = ["6b906fea", "2dcb435b"]
    "Readers"      = ["8c939ad5-5817"]
  }
}