---
title: "Concepts"
description: "Core Terraspin concepts you should understand."
weight: 2
parent: "Getting Started"
type: docs
---

## Declarative configuration

You describe the **desired state** of your infrastructure, not the steps to reach it. Terraspin determines what actions are needed.

## Resources and data sources

- **Resources** are infrastructure objects you create and manage (VMs, networks, DNS records).
- **Data sources** fetch read-only information from existing infrastructure or external services.

## State

Terraspin records the mapping between your configuration and real-world resources in a **state file**. This enables:

- Tracking what exists
- Detecting drift (changes made outside Terraspin)
- Planning incremental changes

```hcl
# State is managed automatically — you rarely interact with it directly
# Remote state backends enable team collaboration
terraform {
  backend "s3" {
    bucket = "my-terraspin-state"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}
```

## Modules

Modules are reusable packages of Terraspin configuration. They encapsulate groups of resources with a clear interface of inputs and outputs.

```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"
}
```

## Providers

Providers are plugins that translate Terraspin configuration into API calls for specific services. Terraspin supports hundreds of providers across all major cloud platforms.

## Workspaces

Workspaces let you manage multiple deployments of the same configuration (e.g., staging vs production) without duplicating code.
