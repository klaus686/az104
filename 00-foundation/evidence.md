# AZ-104 ShamliFoods — Foundation Evidence

## Module 00 — Foundation

## 1. Evidence Summary

The Foundation module establishes the Azure subscription, primary region, resource-group architecture, and project tagging standard.

## 2. Evidence Register

| ID | Screenshot | Azure Portal Location | Purpose | AZ-104 Concept |
|---|---|---|---|---|
| E001 | `001-subscription.png` | Subscriptions | Verify active Azure subscription | Azure subscriptions |
| E002 | `002-resource-groups.png` | Resource groups | Verify six project resource groups | Resource groups |
| E003 | `003-resource-group-tags.png` | Resource group / Tags | Verify project tagging | Resource organization and tags |

## 3. E001 — Subscription

**Screenshot:** `001-subscription.png`

**Purpose:** Demonstrates the active Azure subscription used for the AZ-104 ShamliFoods lab.

**Validation:** Subscription is active and available for project deployments.

## 4. E002 — Resource Groups

**Screenshot:** `002-resource-groups.png`

**Purpose:** Demonstrates the project resource-group architecture.

Expected resource groups:

- `rg-az104-shamlifoods-core`
- `rg-az104-shamlifoods-identity`
- `rg-az104-shamlifoods-storage`
- `rg-az104-shamlifoods-compute`
- `rg-az104-shamlifoods-network`
- `rg-az104-shamlifoods-monitor`

**Validation:** All six resource groups are present.

## 5. E003 — Resource Group Tags

**Screenshot:** `003-resource-group-tags.png`

**Purpose:** Demonstrates the project tagging standard.

Expected tags:

- `Project = AZ104-ShamliFoods`
- `Environment = Lab`
- `CostCenter = AZ104`
- `ManagedBy = Azure`

**Validation:** Project tags are applied to the foundation resource groups.

## 6. Evidence Directory

Store the screenshots in:

```text
00-foundation/screenshots/
```

Directory:

```text
00-foundation/screenshots/
├── 001-subscription.png
├── 002-resource-groups.png
└── 003-resource-group-tags.png
```

## 7. Evidence-to-AZ-104 Mapping

| Evidence | AZ-104 Area |
|---|---|
| E001 | Manage Azure subscriptions |
| E002 | Manage resource groups |
| E003 | Apply resource organization and tags |

## 8. Validation Summary

- [x] Subscription verified
- [x] East US selected
- [x] Six resource groups created
- [x] Four project tags defined
- [x] Resource groups verified
- [x] Screenshots captured
- [x] Evidence filenames documented

## 9. Module Completion

**Module:** 00 — Foundation

**Status:** Complete

**Evidence:** 3 screenshots
