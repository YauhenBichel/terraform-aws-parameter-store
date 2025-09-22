terraform {
    required_version = ">= 1.0"

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
}

resource "aws_ssm_parameter" "store_parameters" {
    
    for_each = var.parameters
    
    name        = "${var.parameter_store_path}${each.key}"
    description = each.value.description
    type        = each.value.type
    value       = each.value.value
    tier        = each.value.tier
    overwrite   = true

    tags = {
        Environment = var.env
        Project     = var.project_name
        ManagedBy   = "Terraform"
    }
}