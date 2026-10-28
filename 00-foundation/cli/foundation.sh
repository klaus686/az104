#!/bin/bash

# ============================================================

# AZ-104 ShamliFoods - Foundation

# Azure CLI automation

# ============================================================

set -e

PROJECT="AZ104-ShamliFoods"
ENVIRONMENT="Lab"
COST_CENTER="AZ104"
MANAGED_BY="Azure"

LOCATION="eastus"

CORE_RG="rg-az104-shamlifoods-core"
IDENTITY_RG="rg-az104-shamlifoods-identity"
STORAGE_RG="rg-az104-shamlifoods-storage"
COMPUTE_RG="rg-az104-shamlifoods-compute"
NETWORK_RG="rg-az104-shamlifoods-network"
MONITOR_RG="rg-az104-shamlifoods-monitor"

echo "Creating AZ-104 ShamliFoods resource groups..."

az group create 
--name "$CORE_RG" 
--location "$LOCATION" 
--tags 
Project="$PROJECT" 
Environment="$ENVIRONMENT" 
CostCenter="$COST_CENTER" 
ManagedBy="$MANAGED_BY"

az group create 
--name "$IDENTITY_RG" 
--location "$LOCATION" 
--tags 
Project="$PROJECT" 
Environment="$ENVIRONMENT" 
CostCenter="$COST_CENTER" 
ManagedBy="$MANAGED_BY"

az group create 
--name "$STORAGE_RG" 
--location "$LOCATION" 
--tags 
Project="$PROJECT" 
Environment="$ENVIRONMENT" 
CostCenter="$COST_CENTER" 
ManagedBy="$MANAGED_BY"

az group create 
--name "$COMPUTE_RG" 
--location "$LOCATION" 
--tags 
Project="$PROJECT" 
Environment="$ENVIRONMENT" 
CostCenter="$COST_CENTER" 
ManagedBy="$MANAGED_BY"

az group create 
--name "$NETWORK_RG" 
--location "$LOCATION" 
--tags 
Project="$PROJECT" 
Environment="$ENVIRONMENT" 
CostCenter="$COST_CENTER" 
ManagedBy="$MANAGED_BY"

az group create 
--name "$MONITOR_RG" 
--location "$LOCATION" 
--tags 
Project="$PROJECT" 
Environment="$ENVIRONMENT" 
CostCenter="$COST_CENTER" 
ManagedBy="$MANAGED_BY"

echo ""
echo "Foundation resource groups:"
az group list 
--query "[?tags.Project=='$PROJECT'].{Name:name,Location:location,Project:tags.Project,Environment:tags.Environment}" 
--output table

echo ""
echo "Foundation deployment completed."
