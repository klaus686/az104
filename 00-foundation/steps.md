# AZ-104 ShamliFoods — Foundation Steps

## Module 00 — Foundation

## 1. Verify Azure Subscription

1. Sign in to the Azure Portal.
2. Open **Subscriptions**.
3. Select the Azure Free subscription.
4. Verify that the subscription is active.
5. Capture evidence as:

`001-subscription.png`

## 2. Select Azure Region

Use:

`East US`

Use the same region for the main project resources unless a specific service requires another region.

## 3. Define Project Tags

Use the following tags:

| Tag | Value |
|---|---|
| Project | AZ104-ShamliFoods |
| Environment | Lab |
| CostCenter | AZ104 |
| ManagedBy | Azure |

## 4. Create Core Resource Group

Create:

`rg-az104-shamlifoods-core`

Region:

`East US`

Apply all four project tags.

## 5. Create Identity Resource Group

Create:

`rg-az104-shamlifoods-identity`

Region:

`East US`

Apply all four project tags.

## 6. Create Storage Resource Group

Create:

`rg-az104-shamlifoods-storage`

Region:

`East US`

Apply all four project tags.

## 7. Create Compute Resource Group

Create:

`rg-az104-shamlifoods-compute`

Region:

`East US`

Apply all four project tags.

## 8. Create Network Resource Group

Create:

`rg-az104-shamlifoods-network`

Region:

`East US`

Apply all four project tags.

## 9. Create Monitoring Resource Group

Create:

`rg-az104-shamlifoods-monitor`

Region:

`East US`

Apply all four project tags.

## 10. Verify Resource Groups

Open **Resource groups** and verify that all six groups exist:

1. `rg-az104-shamlifoods-core`
2. `rg-az104-shamlifoods-identity`
3. `rg-az104-shamlifoods-storage`
4. `rg-az104-shamlifoods-compute`
5. `rg-az104-shamlifoods-network`
6. `rg-az104-shamlifoods-monitor`

Capture:

`002-resource-groups.png`

## 11. Verify Tags

Open the resource groups and verify that the project tags are applied.

Capture:

`003-resource-group-tags.png`

## 12. Foundation Screenshot Evidence

Store screenshots under:

```text
00-foundation/screenshots/
```

Required screenshots:

```text
001-subscription.png
002-resource-groups.png
003-resource-group-tags.png
```

## 13. Azure CLI Automation

The reusable Azure CLI template is:

```text
00-foundation/cli/foundation.sh
```

Before execution:

```bash
az account show
```

Confirm the correct subscription.

Then review the script before running it.

## 14. Azure PowerShell Automation

The reusable PowerShell template is:

```text
00-foundation/powershell/foundation.ps1
```

Verify the active subscription before execution.

## 15. Bicep Automation

The reusable Bicep template is:

```text
00-foundation/bicep/foundation.bicep
```

The template targets subscription scope and creates the six resource groups with common project tags.

## 16. Automation Safety

Before running automation:

- Confirm subscription.
- Confirm region.
- Review resource names.
- Review tags.
- Validate templates.
- Avoid running against production subscriptions.

## 17. Final Foundation Validation

Verify:

- Azure subscription is active.
- East US is selected.
- Six resource groups exist.
- Four project tags are defined.
- Resource groups are correctly organized.
- Three evidence screenshots are captured.
- CLI template exists.
- PowerShell template exists.
- Bicep template exists.

## 18. Final Foundation Structure

```text
00-foundation/
├── README.md
├── steps.md
├── evidence.md
├── screenshots/
│   ├── 001-subscription.png
│   ├── 002-resource-groups.png
│   └── 003-resource-group-tags.png
├── cli/
│   └── foundation.sh
├── powershell/
│   └── foundation.ps1
└── bicep/
    └── foundation.bicep
```

## 19. Foundation Completion

**Module:** 00 — Foundation

**Status:** Complete

**Region:** East US

**Resource Groups:** 6

**Tags:** 4

**Evidence:** 3 screenshots
