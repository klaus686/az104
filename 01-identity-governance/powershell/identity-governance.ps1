# ============================================================

# AZ-104 ShamliFoods - Identity & Governance

# Azure PowerShell automation

# ============================================================

# Required modules:

# Install-Module Az -Scope CurrentUser

# Install-Module Microsoft.Graph -Scope CurrentUser

Connect-AzAccount
Connect-MgGraph -Scopes `
"Group.ReadWrite.All",
"User.Read.All"

$SubscriptionId = (Get-AzContext).Subscription.Id

$CoreRG    = "rg-az104-shamlifoods-core"
$ComputeRG = "rg-az104-shamlifoods-compute"
$StorageRG = "rg-az104-shamlifoods-storage"
$MonitorRG = "rg-az104-shamlifoods-monitor"

# ------------------------------------------------------------

# 1. Create Entra security groups

# ------------------------------------------------------------

$GroupNames = @(
"AZ104-Administrators",
"AZ104-Developers",
"AZ104-Operations",
"AZ104-Readers"
)

foreach ($GroupName in $GroupNames) {

```
$ExistingGroup = Get-MgGroup `
    -Filter "displayName eq '$GroupName'"

if (-not $ExistingGroup) {

    New-MgGroup `
        -DisplayName $GroupName `
        -MailEnabled:$false `
        -MailNickname $GroupName `
        -SecurityEnabled:$true

    Write-Host "Created group: $GroupName"
}
else {
    Write-Host "Group already exists: $GroupName"
}
```

}

# ------------------------------------------------------------

# 2. Retrieve group IDs

# ------------------------------------------------------------

$AdminGroup = Get-MgGroup `
-Filter "displayName eq 'AZ104-Administrators'"

$DeveloperGroup = Get-MgGroup `
-Filter "displayName eq 'AZ104-Developers'"

$OperationsGroup = Get-MgGroup `
-Filter "displayName eq 'AZ104-Operations'"

$ReaderGroup = Get-MgGroup `
-Filter "displayName eq 'AZ104-Readers'"

# ------------------------------------------------------------

# 3. Azure RBAC

# ------------------------------------------------------------

New-AzRoleAssignment `    -ObjectId $AdminGroup.Id`
-RoleDefinitionName "Contributor" `
-ResourceGroupName $CoreRG

New-AzRoleAssignment `    -ObjectId $DeveloperGroup.Id`
-RoleDefinitionName "Contributor" `
-ResourceGroupName $ComputeRG

New-AzRoleAssignment `    -ObjectId $OperationsGroup.Id`
-RoleDefinitionName "Contributor" `
-ResourceGroupName $StorageRG

New-AzRoleAssignment `    -ObjectId $ReaderGroup.Id`
-RoleDefinitionName "Reader" `
-ResourceGroupName $MonitorRG

# ------------------------------------------------------------

# 4. Resource lock

# ------------------------------------------------------------

New-AzResourceLock `    -LockLevel CanNotDelete`
-LockName "AZ104-Core-CannotDelete" `    -ResourceGroupName $CoreRG`
-Force

# ------------------------------------------------------------

# 5. Verification

# ------------------------------------------------------------

Write-Host ""
Write-Host "RBAC assignments:"

Get-AzRoleAssignment |
Where-Object {
$*.Scope -like "*$CoreRG*" -or
$*.Scope -like "*$ComputeRG*" -or
$*.Scope -like "*$StorageRG*" -or
$*.Scope -like "*$MonitorRG*"
} |
Select-Object DisplayName, RoleDefinitionName, Scope

Write-Host ""
Write-Host "Resource locks:"

Get-AzResourceLock `
-ResourceGroupName $CoreRG |
Select-Object Name, LockLevel, ResourceGroupName

Write-Host ""
Write-Host "Identity & Governance automation completed."
