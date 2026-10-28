#!/bin/bash

# ============================================================

# AZ-104 ShamliFoods - Storage

# Azure CLI automation

#

# IMPORTANT:

# Review all values before execution.

# This script is intended as an automation/reference script.

# Do not run against production resources without review.

# ============================================================

set -e

LOCATION="eastus"

STORAGE_ACCOUNT="staz104shamlifoods01"
REPLICA_ACCOUNT="staz104shamlifoods02"

CONTAINER="customer-data"
REPLICA_CONTAINER="customer-data-replica"
FILE_SHARE="customer-files"

PROJECT="AZ104-ShamliFoods"

echo "============================================================"
echo "AZ-104 ShamliFoods - Storage Automation"
echo "============================================================"

# ------------------------------------------------------------

# 1. Storage account information

# ------------------------------------------------------------

echo ""
echo "Storage account:"
az storage account show 
--name "$STORAGE_ACCOUNT" 
--query "{Name:name,Location:primaryLocation,Sku:sku.name,Kind:kind,AccessTier:accessTier}" 
--output table

# ------------------------------------------------------------

# 2. List containers

# ------------------------------------------------------------

echo ""
echo "Blob containers:"

az storage container list 
--account-name "$STORAGE_ACCOUNT" 
--auth-mode login 
--query "[].{Name:name,PublicAccess:properties.publicAccess}" 
--output table

# ------------------------------------------------------------

# 3. Create customer-data container if required

# ------------------------------------------------------------

az storage container create 
--account-name "$STORAGE_ACCOUNT" 
--name "$CONTAINER" 
--public-access off 
--auth-mode login 
--metadata 
project="$PROJECT" 
environment="lab" 
dataType="customer-data"

# ------------------------------------------------------------

# 4. Blob service properties

# ------------------------------------------------------------

echo ""
echo "Blob service properties:"

az storage account blob-service-properties show 
--account-name "$STORAGE_ACCOUNT" 
--resource-group "rg-az104-shamlifoods-storage" 
--query "{Versioning:isVersioningEnabled,ChangeFeed:changeFeed.enabled,BlobDeleteRetention:deleteRetentionPolicy.days,ContainerDeleteRetention:containerDeleteRetentionPolicy.days}" 
--output table

# ------------------------------------------------------------

# 5. List blobs

# ------------------------------------------------------------

echo ""
echo "Blobs in customer-data:"

az storage blob list 
--account-name "$STORAGE_ACCOUNT" 
--container-name "$CONTAINER" 
--auth-mode login 
--query "[].{Name:name,Size:properties.contentLength,Tier:properties.blobTier}" 
--output table

# ------------------------------------------------------------

# 6. Storage account networking

# ------------------------------------------------------------

echo ""
echo "Storage networking:"

az storage account show 
--name "$STORAGE_ACCOUNT" 
--resource-group "rg-az104-shamlifoods-storage" 
--query "{PublicNetworkAccess:publicNetworkAccess,DefaultNetworkAction:networkRuleSet.defaultAction,Bypass:networkRuleSet.bypass}" 
--output table

# ------------------------------------------------------------

# 7. Azure Files

# ------------------------------------------------------------

echo ""
echo "File shares:"

az storage share-rm list 
--storage-account "$STORAGE_ACCOUNT" 
--query "[].{Name:name,QuotaGB:shareQuota,EnabledProtocols:enabledProtocols}" 
--output table

# ------------------------------------------------------------

# 8. Create customer-files if required

# ------------------------------------------------------------

az storage share-rm create 
--storage-account "$STORAGE_ACCOUNT" 
--name "$FILE_SHARE" 
--quota 5 
--enabled-protocols SMB 
--access-tier TransactionOptimized 
--output none

# ------------------------------------------------------------

# 9. Storage account security configuration

# ------------------------------------------------------------

echo ""
echo "Storage security configuration:"

az storage account show 
--name "$STORAGE_ACCOUNT" 
--resource-group "rg-az104-shamlifoods-storage" 
--query "{HttpsOnly:enableHttpsTrafficOnly,MinTLS:minimumTlsVersion,AllowBlobPublicAccess:allowBlobPublicAccess,AllowSharedKeyAccess:allowSharedKeyAccess}" 
--output table

# ------------------------------------------------------------

# 10. List storage account keys

# ------------------------------------------------------------

# Keys are intentionally NOT printed or stored.

echo ""
echo "Storage account key access is available."
echo "Keys are intentionally not displayed or stored by this script."

# ------------------------------------------------------------

# 11. Replica storage account

# ------------------------------------------------------------

echo ""
echo "Replica storage account:"

az storage account show 
--name "$REPLICA_ACCOUNT" 
--query "{Name:name,Location:primaryLocation,Sku:sku.name,Kind:kind}" 
--output table

echo ""
echo "Storage automation validation completed."
