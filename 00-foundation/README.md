# AZ-104 ShamliFoods — Foundation

## Module 00 — Foundation

This module establishes the Azure environment, resource-group structure, naming convention, tagging standard, region, and automation baseline for the AZ-104 ShamliFoods project.

## 1. Objectives

- Establish a consistent Azure lab structure.
- Create dedicated resource groups for each AZ-104 domain.
- Apply consistent naming and tagging.
- Use East US as the project region.
- Prepare reusable Azure CLI, PowerShell, and Bicep automation.
- Establish a clean foundation for the remaining AZ-104 modules.

## 2. Project Environment

| Item | Value |
|---|---|
| Project | AZ104-ShamliFoods |
| Azure Region | East US |
| Environment | Lab |
| Cost Center | AZ104 |
| Managed By | Azure |

## 3. Resource Group Architecture

| Resource Group | Purpose |
|---|---|
| `rg-az104-shamlifoods-core` | Core/shared resources |
| `rg-az104-shamlifoods-identity` | Identity and governance resources |
| `rg-az104-shamlifoods-storage` | Storage resources |
| `rg-az104-shamlifoods-compute` | Compute resources |
| `rg-az104-shamlifoods-network` | Networking resources |
| `rg-az104-shamlifoods-monitor` | Monitoring resources |

## 4. Naming Convention

The project uses the following general naming pattern:

`<resource-type>-az104-shamlifoods-<purpose>`

Examples:

- `rg-az104-shamlifoods-core`
- `rg-az104-shamlifoods-storage`
- `staz104shamlifoods01`

## 5. Azure Region

The project uses **East US** as the primary Azure region.

Using one primary region simplifies the lab, documentation, and resource management.

## 6. Project Tags

All applicable resources use:

| Tag | Value |
|---|---|
| `Project` | `AZ104-ShamliFoods` |
| `Environment` | `Lab` |
| `CostCenter` | `AZ104` |
| `ManagedBy` | `Azure` |

## 7. Azure Portal Work

The foundation was created and verified through the Azure Portal.

The following were established:

1. Azure subscription verified.
2. East US selected as the primary region.
3. Six project resource groups created.
4. Project tags applied.
5. Resource-group organization verified.

## 8. Resource Organization

Resources are separated by AZ-104 learning domain rather than placing the entire lab into a single resource group.

This makes it easier to:

- apply RBAC at appropriate scopes;
- apply policies and locks;
- manage costs;
- test resource lifecycle operations;
- document each AZ-104 module independently.

## 9. Evidence

Foundation evidence consists of three screenshots:

- `001-subscription.png`
- `002-resource-groups.png`
- `003-resource-group-tags.png`

See `evidence.md` for the evidence register.

## 10. Automation

Reusable automation templates are stored under:

```text
00-foundation/
├── cli/
│   └── foundation.sh
├── powershell/
│   └── foundation.ps1
└── bicep/
    └── foundation.bicep
```

The automation demonstrates:

- Azure CLI resource-group creation;
- Azure PowerShell resource-group creation;
- Bicep subscription-scope deployment;
- common project tagging.

These files are reusable templates and should be reviewed before execution.

## 11. Automation Safety

Automation files do not contain passwords, secrets, or personal credentials.

Before running automation:

1. Confirm the active Azure subscription.
2. Confirm the target region.
3. Review resource names.
4. Review tags.
5. Run validation where applicable.
6. Confirm that the deployment will not overwrite production resources.

## 12. AZ-104 Concepts Demonstrated

This module demonstrates:

- Azure subscriptions;
- resource groups;
- Azure regions;
- resource organization;
- resource naming;
- Azure tags;
- Azure CLI;
- Azure PowerShell;
- Bicep;
- basic Azure governance practices.

## 13. Cost Management Approach

The project follows a free-first approach.

Principles:

- Use Azure Free/low-cost services where possible.
- Avoid unnecessary paid resources.
- Create expensive resources only when required for an AZ-104 lab.
- Capture required evidence.
- Delete paid resources after testing.
- Review Azure Cost Management regularly.

## 14. Security Principles

The foundation follows basic security principles:

- Separate resources by function.
- Use dedicated identity and governance scopes.
- Avoid storing credentials in GitHub.
- Use least privilege in later RBAC configuration.
- Use tags and governance controls to improve resource visibility.

## 15. Lessons Learned

The foundation demonstrates why a consistent Azure structure is important before deploying workloads.

A structured resource-group and tagging strategy makes later administration, RBAC, policy, cost management, and troubleshooting easier.

## 16. Module Structure

```text
00-foundation/
├── README.md
├── steps.md
├── evidence.md
├── screenshots/
├── cli/
│   └── foundation.sh
├── powershell/
│   └── foundation.ps1
└── bicep/
    └── foundation.bicep
```

## 17. Completion Checklist

- [x] Azure subscription verified
- [x] East US selected
- [x] Six resource groups created
- [x] Four project tags defined
- [x] Resource organization verified
- [x] Foundation screenshots captured
- [x] Azure CLI template prepared
- [x] Azure PowerShell template prepared
- [x] Bicep template prepared

**Module Status:** Complete

**Region:** East US

**Resource Groups:** 6

**Tags:** 4

**Automation:** CLI / PowerShell / Bicep

**Evidence:** 3 screenshots
