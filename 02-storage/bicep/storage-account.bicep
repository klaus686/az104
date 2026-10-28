@description('Storage account name. Must be globally unique.')
param storageAccountName string

@description('Azure region for the storage account.')
param location string = resourceGroup().location

@description('Project name used for tagging.')
param projectName string = 'AZ104-ShamliFoods'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  tags: {
    Project: projectName
    Environment: 'Lab'
    CostCenter: 'AZ104'
    ManagedBy: 'Azure'
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: true
    publicNetworkAccess: 'Enabled'
    networkAcls: {
      defaultAction: 'Allow'
      bypass: 'AzureServices'
    }
    blobRestorePolicy: {
      enabled: false
    }
    deleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}