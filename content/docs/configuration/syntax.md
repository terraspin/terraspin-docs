---
title: "Syntax Overview"
description: "Understand the Terraspin configuration syntax."
weight: 1
parent: "Configuration"
type: docs
---

## Syntax basics

Terraspin configurations are written in HCL (HashiCorp Configuration Language). Here are the key constructs:

### Blocks

Blocks are the fundamental unit of configuration. They have a type, optional labels, and a body:

```hcl
resource "aws_instance" "web" {
  ami           = "ami-abc123"
  instance_type = "t3.micro"
}
```

### Arguments

Arguments assign a value to a name within a block:

```hcl
region = "us-east-1"
```

### Expressions

Expressions produce values. They can be literals, references, or function calls:

```hcl
# String literal
name = "hello"

# Reference
vpc_id = aws_vpc.main.id

# Function call
upper_name = upper(var.name)
```

## Variables

Variables allow parameterization:

```hcl
variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type"
}
```

## Outputs

Outputs expose values after apply:

```hcl
output "instance_ip" {
  value       = aws_instance.web.public_ip
  description = "Public IP of the web server"
}
```

## Data sources

Data sources fetch data that exists outside your configuration:

```hcl
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }
}
```

## Locals

Locals define named expressions for reuse within a module:

```hcl
locals {
  name_prefix = "${var.project}-${var.environment}"
  common_tags = {
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "terraspin"
  }
}
```
