# AZ-104 ShamliFoods — Identity & Governance

## Module 01 — Identity & Governance

## 1. Objectives

This module implements the identity and governance foundation for the AZ-104 ShamliFoods Azure environment.

The module demonstrates:

- Microsoft Entra security groups;
- Microsoft Entra lab users;
- group membership;
- Azure RBAC;
- Azure Policy;
- resource locks;
- Azure Cost Management;
- budgets;
- least-privilege administration;
- repeatable automation.

## 2. Identity Architecture

The lab uses four security groups:

| Group | Purpose |
|---|---|
| `AZ104-Administrators` | Administrative access |
| `AZ104-Developers` | Compute development access |
| `AZ104-Operations` | Storage operations access |
| `AZ104-Readers` | Read-only monitoring access |

Four lab users are associated with the groups.

## 3. Microsoft Entra Groups

The following groups were created:

- `AZ104-Administrators`
- `AZ104-Developers`
- `AZ104-Operations`
- `AZ104-Readers`

Configuration:

- Group type: Security
- Membership type: Assigned

## 4. Microsoft Entra Users

The following lab users were created:

- `azadmin`
- `azdeveloper`
- `azoperations`
- `azreader`

The tenant-generated `.onmicrosoft.com` UPNs are used for the lab.

Passwords are treated as secrets and are not stored in GitHub.

## 5. Group Membership

| Group | Member |
|---|---|
| `AZ104-Administrators` | `azadmin` |
| `AZ104-Developers` | `azdeveloper` |
| `AZ104-Operations` | `azoperations` |
| `AZ104-Readers` | `azreader` |

## 6. Azure RBAC Design

The project uses resource-group-scoped RBAC.

| Resource Group | Group | Role |
|---|---|---|
| `rg-az104-shamlifoods-core` | `AZ104-Administrators` | Contributor |
| `rg-az104-shamlifoods-compute` | `AZ104-Developers` | Contributor |
| `rg-az104-shamlifoods-storage` | `AZ104-Operations` | Contributor |
| `rg-az104-shamlifoods-monitor` | `AZ104-Readers` | Reader |

This demonstrates group-based access rather than assigning roles individually to every user.

## 7. RBAC Evidence

Screenshots:

- `004-admin-rbac.png`
- `005-developer-rbac.png`
- `006-operations-rbac.png`
- `007-reader-rbac.png`

## 8. RBAC Scope Verification

Additional screenshots verify the actual resource-group scopes:

- `008-developer-rbac-scope.png`
- `009-operations-rbac-scope.png`
- `010-reader-rbac-scope.png`
- `011-administrator-rbac-scope.png`

## 9. Azure Policy

A built-in policy was used to require a project tag on resources.

Configuration:

- Policy: Require a tag on resources
- Tag: `Project`
- Required value: `AZ104-ShamliFoods`
- Effect: Audit
- Assignment: `Require-Project-Tag`

## 10. Policy Compliance

Policy compliance was verified and recorded as 100% for the applicable lab scope.

Evidence:

- `012-policy-project-tag.png`
- `013-policy-compliance.png`

## 11. Resource Lock

A CanNotDelete resource lock was created on:

`rg-az104-shamlifoods-core`

Lock name:

`AZ104-Core-CannotDelete`

The lock prevents accidental deletion of the protected resource group.

Evidence:

- `014-resource-lock.png`
- `015-resource-lock-test.png`

## 12. Resource Lock Validation

A deletion operation was tested against the protected resource group.

The resource lock prevented deletion.

This demonstrates the practical use of Azure resource locks as a governance control.

## 13. Cost Management

Azure Cost Management was reviewed for the project.

Evidence:

`016-cost-analysis.png`

The project follows a free-first approach and paid resources are created only when required for the lab.

## 14. Budget

A monthly budget was configured:

| Setting | Value |
|---|---|
| Budget name | `AZ104-ShamliFoods-Monthly-Budget` |
| Frequency | Monthly |
| Amount | ₹500 |
| Alerts | 50%, 80%, 100% |
| Notification | Email |

Evidence:

`017-budget.png`

The budget is an alerting mechanism and is not a hard spending cap.

## 15. Governance Architecture

The governance model is:

```text
Microsoft Entra
│
├── Security Groups
│   ├── Administrators
│   ├── Developers
│   ├── Operations
│   └── Readers
│
├── Users
│   ├── azadmin
│   ├── azdeveloper
│   ├── azoperations
│   └── azreader
│
└── Azure RBAC
    ├── Core → Contributor
    ├── Compute → Contributor
    ├── Storage → Contributor
    └── Monitor → Reader

Azure Governance
├── Azure Policy
├── Resource Lock
└── Cost Management / Budget
```

## 16. Least-Privilege Approach

Access is assigned through groups and scoped to the resource group where possible.

The design avoids giving every lab user subscription-wide administrative permissions.

## 17. Security Considerations

- Passwords are not stored in the repository.
- RBAC is assigned through security groups.
- Reader access is used where write access is unnecessary.
- Resource locks protect important lab resources.
- Azure Policy provides governance.
- Cost alerts help identify unexpected spending.

## 18. Automation

Automation templates are stored under:

```text
01-identity-governance/
├── cli/
│   └── identity-governance.sh
├── powershell/
│   └── identity-governance.ps1
└── bicep/
    └── identity-governance.bicep
```

The CLI template uses Azure CLI.

The PowerShell template uses Microsoft Graph and Az modules.

The Bicep template handles Azure resource-side RBAC and resource locks.

Microsoft Entra users and groups are intentionally not created by Bicep.

## 19. Automation Safety

Automation files do not store passwords or secrets.

Review the active subscription and resource-group scope before executing automation.

## 20. Evidence

The module contains 17 screenshots.

See `evidence.md` for the complete evidence register.

## 21. AZ-104 Concepts Demonstrated

- Microsoft Entra users and groups
- Group membership
- Azure RBAC
- RBAC scopes
- Azure Policy
- Policy compliance
- Resource locks
- Cost Management
- Budgets
- Least privilege
- Azure CLI
- Azure PowerShell
- Bicep

## 22. Lessons Learned

Group-based RBAC provides a cleaner administration model than assigning permissions to individual users.

Policy, resource locks, and budgets provide complementary governance controls:

- Policy controls configuration compliance.
- Resource locks protect important resources.
- Budgets provide cost alerts.

## 23. Module Structure

```text
01-identity-governance/
├── README.md
├── steps.md
├── evidence.md
├── screenshots/
├── cli/
│   └── identity-governance.sh
├── powershell/
│   └── identity-governance.ps1
└── bicep/
    └── identity-governance.bicep
```

## 24. Completion Checklist

- [x] Four security groups created
- [x] Four lab users created
- [x] Group membership configured
- [x] Four RBAC configurations implemented
- [x] RBAC scopes verified
- [x] Azure Policy configured
- [x] Policy compliance verified
- [x] Resource lock configured
- [x] Resource lock tested
- [x] Cost Management reviewed
- [x] Monthly budget configured
- [x] 17 evidence screenshots captured

**Module Status:** Complete

**Security Groups:** 4

**Lab Users:** 4

**RBAC Assignments:** 4

**Azure Policy:** Configured

**Resource Lock:** Configured and tested

**Budget:** Configured

**Evidence:** 17 screenshots
