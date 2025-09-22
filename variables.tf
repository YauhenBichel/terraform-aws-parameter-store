# AWS Metadata

variable "env" {
  description = "The environment being deployed to, e.g. dev, uat, prod"
  type        = string
  nullable    = false
}

variable "service_domain" {
  description = "Used to help create namespaced deployments in case of shared account."
  type = string
  nullable = false
}

variable "team" {
  default     = "infra-team"
  description = "My team"
  type = string
  nullable = false
}

variable "aws_region" {
  default     = "eu-west-2"
  description = "Where this will be deployed to"
  type = string
  nullable = false
}

variable "project_name" {
  default     = "aws-ssm-parameter-store-tf-module"
  description = "GitHub repository name"
  type = string
  nullable = false
}

# Parameter Store

variable "parameter_store_path" {
    description = "Path to parameter in Parameter Store"
    type = string
    nullable = false
}

variable "parameters" {
  description = "Map of parameters to create in Parameter Store"
  type = map(object({
    value       = string
    type        = string
    description = optional(string)
    tier        = optional(string, "Standard")
  }))
}
