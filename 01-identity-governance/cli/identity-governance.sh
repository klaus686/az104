#!/bin/bash

# ============================================================

# AZ-104 ShamliFoods - Identity & Governance

# Azure CLI automation

#

# IMPORTANT:

# - Review IDs/scopes before running.

# - No passwords or secrets are stored in this file.

# ============================================================

set -e

SUBSCRIPTION_ID=$(az account show --query id -o tsv)

CORE_RG="rg-az104-shamlifoods-core"
COMPUTE_RG="rg-az104-shamlifoods-compute"
STORAGE_RG="rg-az104-shamlifoods-storage"
MONITOR_RG="rg-az104-shamlifoods-monitor"

echo "Subscription: $SUBSCRIPTION_ID"

# ------------------------------------------------------------

# 1. Create Entra security groups

# ------------------------------------------------------------

for GROUP in 
"AZ104-Administrators" 
"AZ104-Developers" 
"AZ104-Operations" 
"AZ104-Readers"
do
EXISTING_ID=$(az ad group show 
--group "$GROUP" 
--query id 
--output tsv 2>/dev/null || true)

```
if [ -z "$EXISTING_ID" ]; then
    az ad group create \
        --display-name "$GROUP" \
        --mail-nickname "$GROUP"

    echo "Created group: $GROUP"
else
    echo "Group already exists: $GROUP"
fi
```

done

# ------------------------------------------------------------

# 2. Retrieve group object IDs

# ------------------------------------------------------------

ADMIN_GROUP_ID=$(az ad group show 
--group "AZ104-Administrators" 
--query id -o tsv)

DEVELOPER_GROUP_ID=$(az ad group show 
--group "AZ104-Developers" 
--query id -o tsv)

OPERATIONS_GROUP_ID=$(az ad group show 
--group "AZ104-Operations" 
--query id -o tsv)

READER_GROUP_ID=$(az ad group show 
--group "AZ104-Readers" 
--query id -o tsv)

# ------------------------------------------------------------

# 3. RBAC assignments

# ------------------------------------------------------------

az role assignment create 
--assignee-object-id "$ADMIN_GROUP_ID" 
--assignee-principal-type Group 
--role "Contributor" 
--scope "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$CORE_RG"

az role assignment create 
--assignee-object-id "$DEVELOPER_GROUP_ID" 
--assignee-principal-type Group 
--role "Contributor" 
--scope "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$COMPUTE_RG"

az role assignment create 
--assignee-object-id "$OPERATIONS_GROUP_ID" 
--assignee-principal-type Group 
--role "Contributor" 
--scope "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$STORAGE_RG"

az role assignment create 
--assignee-object-id "$READER_GROUP_ID" 
--assignee-principal-type Group 
--role "Reader" 
--scope "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$MONITOR_RG"

echo "RBAC assignments completed."

# ------------------------------------------------------------

# 4. Resource lock

# ------------------------------------------------------------

az lock create 
--name "AZ104-Core-CannotDelete" 
--lock-type CanNotDelete 
--resource-group "$CORE_RG"

echo "Resource lock configured."

# ------------------------------------------------------------

# 5. Verify RBAC

# ------------------------------------------------------------

echo ""
echo "RBAC assignments:"
az role assignment list 
--all 
--query "[?contains(scope, '$CORE_RG') || contains(scope, '$COMPUTE_RG') || contains(scope, '$STORAGE_RG') || contains(scope, '$MONITOR_RG')].{Principal:principalName,Role:roleDefinitionName,Scope:scope}" 
--output table

echo ""
echo "Identity & Governance automation completed."
