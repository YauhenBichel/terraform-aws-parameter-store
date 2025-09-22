output "created_parameter_store_parameters" {
  description = "Created store parameters"
  value = {
    for k, v in aws_ssm_parameter.store_parameters : k => {
      name    = v.name
      arn     = v.arn
      version = v.version
      type    = v.type
    }
  }
}