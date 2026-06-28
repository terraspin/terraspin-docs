---
title: "Commands"
description: "All Terraspin CLI commands and their usage."
weight: 1
parent: "CLI Reference"
type: docs
---

## Core commands

### init

Initialize a working directory containing Terraspin configuration files.

```bash
terraspin init [options]
```

| Flag | Description |
|------|-------------|
| `-backend-config` | Backend configuration |
| `-lockfile` | Write dependency lockfile |
| `-upgrade` | Upgrade modules and providers |

### plan

Show changes required by the current configuration.

```bash
terraspin plan [options]
```

| Flag | Description |
|------|-------------|
| `-out` | Write a plan file |
| `-target` | Resource to target |
| `-var` | Set a variable value |

### apply

Apply the changes required to reach the desired state.

```bash
terraspin apply [plan]
```

### destroy

Destroy all remote objects managed by the configuration.

```bash
terraspin destroy [options]
```

## State commands

### state list

List resources in state:

```bash
terraspin state list
```

### state show

Show a resource in state:

```bash
terraspin state show aws_instance.web
```

## Workspace commands

### workspace list

```bash
terraspin workspace list
```

### workspace new

```bash
terraspin workspace new staging
```

### workspace select

```bash
terraspin workspace select staging
```

## Other commands

| Command | Description |
|---------|-------------|
| `fmt` | Reformat configuration files |
| `validate` | Validate configuration |
| `graph` | Generate dependency graph |
| `output` | Show output values |
| `providers` | Show required providers |
| `version` | Print version |
