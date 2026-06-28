---
title: "Quickstart"
description: "Install Terraspin and provision your first resource in five minutes."
weight: 1
parent: "Getting Started"
type: docs
---

## 1. Install Terraspin

Download the latest binary for your platform:

```bash
# macOS (Homebrew)
brew install terraspin

# Linux
curl -fsSL https://get.terraspin.sh | sh

# Verify the install
terraspin --version
```

## 2. Write your first configuration

Create a `main.tf` file:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"

  tags = {
    Name = "terraspin-example"
  }
}
```

## 3. Initialize and plan

```bash
# Initialize the working directory
terraspin init

# Preview the changes
terraspin plan
```

## 4. Apply

```bash
terraspin apply
```

Review the plan output and type `yes` to confirm. Terraspin provisions the declared resources and writes the state file.

## Where to go next

- [Configuration Guide](/docs/configuration/) — learn the configuration language
- [CLI Reference](/docs/cli/) — all subcommands and flags
- [Providers](/docs/providers/) — browse supported providers
