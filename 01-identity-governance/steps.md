# AZ-104 ShamliFoods — Identity & Governance Steps

## Module 01 — Identity & Governance

## 1. Verify Azure Environment

Verify the Azure subscription and confirm that the foundation resource groups exist.

Required resource groups:

- `rg-az104-shamlifoods-core`
- `rg-az104-shamlifoods-identity`
- `rg-az104-shamlifoods-storage`
- `rg-az104-shamlifoods-compute`
- `rg-az104-shamlifoods-network`
- `rg-az104-shamlifoods-monitor`

## 2. Create Microsoft Entra Security Groups

Create four Security groups:

1. `AZ104-Administrators`
2. `AZ104-Developers`
3. `AZ104-Operations`
4. `AZ104-Readers`

Use:

- Group type: Security
- Membership type: Assigned

## 3. Create Microsoft Entra Lab Users

Create:

1. `azadmin`
2. `azdeveloper`
3. `azoperations`
4. `azreader`

Use tenant-generated `.onmicrosoft.com` UPNs.

Do not store passwords in GitHub.

## 4. Configure Group Membership

Configure:

| Group | User |
|---|---|
| `AZ104-Administrators` | `azadmin` |
| `AZ104-Developers` | `azdeveloper` |
| `AZ104-Operations` | `azoperations` |
| `AZ104-Readers` | `azreader` |

## 5. Configure Azure RBAC

### 5.1 Administrator RBAC

Scope:

`rg-az104-shamlifoods-core`

Group:

`AZ104-Administrators`

Role:

`Contributor`

### 5.2 Developer RBAC

Scope:

`rg-az104-shamlifoods-compute`

Group:

`AZ104-Developers`

Role:

`Contributor`

### 5.3 Operations RBAC

Scope:

`rg-az104-shamlifoods-storage`

Group:

`AZ104-Operations`

Role:

`Contributor`

### 5.4 Reader RBAC

Scope:

`rg-az104-shamlifoods-monitor`

Group:

`AZ104-Readers`

Role:

`Reader`

## 6. Verify RBAC Assignments

Verify the four role assignments and their resource-group scopes.

Capture:

- `004-admin-rbac.png`
- `005-developer-rbac.png`
- `006-operations-rbac.png`
- `007-reader-rbac.png`
- `008-developer-rbac-scope.png`
- `009-operations-rbac-scope.png`
- `010-reader-rbac-scope.png`
- `011-administrator-rbac-scope.png`

## 7. Configure Azure Policy

Use the built-in:

**Require a tag on resources**

Configure:

- Tag name: `Project`
- Required value: `AZ104-ShamliFoods`
- Effect: `Audit`

## 8. Create Policy Assignment

Assignment name:

`Require-Project-Tag`

Assign it to the appropriate project scope.

## 9. Verify Policy Compliance

Verify the policy assignment and compliance results.

Expected project configuration:

`Project = AZ104-ShamliFoods`

Capture:

- `012-policy-project-tag.png`
- `013-policy-compliance.png`

## 10. Create Resource Lock

Create a CanNotDelete lock on:

`rg-az104-shamlifoods-core`

Lock name:

`AZ104-Core-CannotDelete`

## 11. Verify Resource Lock

Verify the lock exists and is associated with the core resource group.

Capture:

`014-resource-lock.png`

## 12. Test Resource Lock

Attempt the appropriate deletion operation and verify that the lock prevents deletion.

Capture:

`015-resource-lock-test.png`

## 13. Review Azure Cost Management

Open Cost Management and review project cost information.

Capture:

`016-cost-analysis.png`

## 14. Create Monthly Budget

Create:

`AZ104-ShamliFoods-Monthly-Budget`

Configure:

- Frequency: Monthly
- Amount: ₹500
- Alerts: 50%, 80%, 100%
- Email notification configured

## 15. Verify Budget

Verify that the budget exists and the alert thresholds are configured.

Capture:

`017-budget.png`

## 16. Capture Evidence

Store all screenshots under:

```text
01-identity-governance/screenshots/
```

Required screenshots:

```text
001-entra-groups.png
002-entra-users.png
003-group-membership.png
004-admin-rbac.png
005-developer-rbac.png
006-operations-rbac.png
007-reader-rbac.png
008-developer-rbac-scope.png
009-operations-rbac-scope.png
010-reader-rbac-scope.png
011-administrator-rbac-scope.png
012-policy-project-tag.png
013-policy-compliance.png
014-resource-lock.png
015-resource-lock-test.png
016-cost-analysis.png
017-budget.png
```

## 17. Automation Files

Automation files:

```text
01-identity-governance/cli/identity-governance.sh
01-identity-governance/powershell/identity-governance.ps1
01-identity-governance/bicep/identity-governance.bicep
```

The files are reusable templates.

## 18. Automation Safety

Before running automation:

- Confirm subscription.
- Confirm resource-group scopes.
- Review RBAC assignments.
- Review policy scope.
- Review lock configuration.
- Do not store passwords or secrets in source control.

## 19. Final Validation

Verify:

- Four security groups exist.
- Four users exist.
- Membership is correct.
- Four RBAC assignments exist.
- RBAC scopes are correct.
- Policy is assigned.
- Policy compliance is verified.
- Resource lock exists.
- Resource lock test was successful.
- Cost Management was reviewed.
- Budget exists with configured alerts.
- All 17 screenshots are stored.

## 20. Module Completion

**Module:** 01 — Identity & Governance

**Status:** Complete

**Security Groups:** 4

**Lab Users:** 4

**RBAC Assignments:** 4

**Azure Policy:** Configured

**Resource Lock:** Configured and tested

**Budget:** Configured

**Evidence:** 17 screenshots
