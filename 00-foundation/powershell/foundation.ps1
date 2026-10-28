# ============================================================

# AZ-104 ShamliFoods - Foundation

# Azure PowerShell automation

# ============================================================

$Project = "AZ104-ShamliFoods"
$Environment = "Lab"
$CostCenter = "AZ104"
$ManagedBy = "Azure"

$Location = "East US"

$ResourceGroups = @(
"rg-az104-shamlifoods-core",
"rg-az104-shamlifoods-identity",
"rg-az104-shamlifoods-storage",
"rg-az104-shamlifoods-compute",
"rg-az104-shamlifoods-network",
"rg-az104-shamlifoods-monitor"
)

$Tags = @{
Project     = $Project
Environment = $Environment
CostCenter  = $CostCenter
ManagedBy   = $ManagedBy
}

Write-Host "Creating AZ-104 ShamliFoods resource groups..."

foreach ($ResourceGroup in $ResourceGroups) {

```
New-AzResourceGroup `
    -Name $ResourceGroup `
    -Location $Location `
    -Tag $Tags `
    -Force

Write-Host "Created/updated: $ResourceGroup"
```

}

Write-Host ""
Write-Host "Foundation resource groups:"

Get-AzResourceGroup |
Where-Object {
$*.Tags["Project"] -eq $Project
} |
Select-Object `
ResourceGroupName,
Location,
@{Name="Project";Expression={$*.Tags["Project"]}},
@{Name="Environment";Expression={$_.Tags["Environment"]}}

Write-Host ""
Write-Host "Foundation deployment completed."
