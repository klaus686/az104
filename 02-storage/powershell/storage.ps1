# ============================================================

# AZ-104 ShamliFoods - Storage

# Azure PowerShell automation

# ============================================================

$StorageAccountName = "staz104shamlifoods01"
$ReplicaAccountName = "staz104shamlifoods02"

$ResourceGroupName = "rg-az104-shamlifoods-storage"

$ContainerName = "customer-data"
$FileShareName = "customer-files"

$ProjectName = "AZ104-ShamliFoods"

# ------------------------------------------------------------

# 1. Storage account information

# ------------------------------------------------------------

Write-Host ""
Write-Host "Storage account information:"

Get-AzStorageAccount `    -ResourceGroupName $ResourceGroupName`
-Name $StorageAccountName |
Select-Object `
StorageAccountName,
ResourceGroupName,
Location,
SkuName,
Kind,
AccessTier

# ------------------------------------------------------------

# 2. Storage context using Microsoft Entra authentication

# ------------------------------------------------------------

$Context = New-AzStorageContext `    -StorageAccountName $StorageAccountName`
-UseConnectedAccount

# ------------------------------------------------------------

# 3. Containers

# ------------------------------------------------------------

Write-Host ""
Write-Host "Blob containers:"

Get-AzStorageContainer `
-Context $Context |
Select-Object Name, PublicAccess

# ------------------------------------------------------------

# 4. Blobs

# ------------------------------------------------------------

Write-Host ""
Write-Host "Blobs in customer-data:"

Get-AzStorageBlob `    -Container $ContainerName`
-Context $Context |
Select-Object `
Name,
Length,
AccessTier,
BlobType

# ------------------------------------------------------------

# 5. Blob service properties

# ------------------------------------------------------------

Write-Host ""
Write-Host "Blob service properties:"

Get-AzStorageBlobServiceProperty `    -ResourceGroupName $ResourceGroupName`
-StorageAccountName $StorageAccountName |
Select-Object `
IsVersioningEnabled,
IsChangeFeedEnabled

# ------------------------------------------------------------

# 6. Azure Files

# ------------------------------------------------------------

Write-Host ""
Write-Host "Azure file shares:"

Get-AzStorageShare `
-Context $Context |
Select-Object Name, QuotaGiB, AccessTier

# ------------------------------------------------------------

# 7. Storage account security

# ------------------------------------------------------------

Write-Host ""
Write-Host "Storage security:"

Get-AzStorageAccount `    -ResourceGroupName $ResourceGroupName`
-Name $StorageAccountName |
Select-Object `
EnableHttpsTrafficOnly,
MinimumTlsVersion,
AllowBlobPublicAccess,
AllowSharedKeyAccess

# ------------------------------------------------------------

# 8. Storage networking

# ------------------------------------------------------------

Write-Host ""
Write-Host "Storage networking:"

$Account = Get-AzStorageAccount `    -ResourceGroupName $ResourceGroupName`
-Name $StorageAccountName

$Account.NetworkRuleSet |
Select-Object `
DefaultAction,
Bypass

# ------------------------------------------------------------

# 9. Replica account

# ------------------------------------------------------------

Write-Host ""
Write-Host "Replica storage account:"

Get-AzStorageAccount |
Where-Object {
$_.StorageAccountName -eq $ReplicaAccountName
} |
Select-Object `
StorageAccountName,
ResourceGroupName,
Location,
SkuName,
Kind

# ------------------------------------------------------------

# 10. Important security rule

# ------------------------------------------------------------

Write-Host ""
Write-Host "Storage keys and SAS tokens are NOT printed or stored."
Write-Host "Storage PowerShell validation completed."
