# Terraform AWS AWS SSM Parameter Store

[![Terraform Registry](https://img.shields.io/badge/Terraform-Registry-7B42BC?logo=terraform&logoColor=white)](https://registry.terraform.io/modules/YauhenBichel/parameter-store/aws/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Creates a set of AWS Systems Manager Parameter Store parameters from a single map, under a common namespaced path. Handles `String`, `StringList` and `SecureString` types, so configuration and secrets can be declared in one place.

## Usage

```hcl
module "parameter_store" {
  source  = "YauhenBichel/parameter-store/aws"
  version = "1.0.0"

  env                  = "prod"
  service_domain       = "payments"
  team                 = "infra-team"
  aws_region           = "eu-west-2"

  parameter_store_path = "/payments/prod"

  parameters = {
    db_host = {
      type        = "String"
      description = "Primary database hostname"
      value       = aws_db_instance.main.address
    }
    api_key = {
      type        = "SecureString"
      description = "Third-party API key"
      value       = var.api_key
    }
  }
}
```

## Requirements

| Name | Version |
|---|---|
| terraform | >= 1.0 |
| aws provider | >= 4.0 |

## Inputs

| Name | Type | Default | Description |
|---|---|---|---|
| `env` | `string` | — | Environment, e.g. `dev`, `uat`, `prod` |
| `service_domain` | `string` | — | Namespaces deployments in a shared account |
| `team` | `string` | `infra-team` | Owning team |
| `aws_region` | `string` | `eu-west-2` | Target region |
| `project_name` | `string` | `aws-ssm-parameter-store-tf-module` | Project name, used in tags |
| `parameter_store_path` | `string` | — | Path prefix for all parameters |
| `parameters` | `map(object)` | — | Map of parameters to create — each with `type`, optional `description`, and `value` |

A dash in the Default column means the input is required.

## Outputs

| Name | Description |
|---|---|
| `created_parameter_store_parameters` | Map of the parameters created, keyed by name |

## Contributing

Issues and pull requests are welcome. Please open an issue describing the problem before
sending a large change.

## Licence

[MIT](LICENSE) — Yauhen Bichel
