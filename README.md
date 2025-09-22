# Terraform module for AWS Parameter Store

## Author is Yauhen Bichel

## How to use 

```
module "aws_parameter_store_parameters" {
  source = "./modules/tf-module-aws-parameter-store"
  
  aws_region                   = var.aws_region
  env                          = var.env
  team                         = var.team
  service_domain               = var.service_domain

  parameter_store_path = var.parameter_store_path
  parameters       = {
    api-username = {
      path        = var.parameter_store_path
      value       = var.api_username
      type        = "SecureString" # "String", "SecureString"
      description = "API Username"
    }
    api-password = {
      path        = var.parameter_store_path
      value       = var.api_password
      type        = "SecureString"
      description = "API Password"
    }
  }
}

```