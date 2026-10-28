targetScope = 'subscription'

@description('Azure region for the resource groups.')
param location string = 'eastus'

@description('Project name used for tagging.')
param projectName string = 'AZ104-ShamliFoods'

@description('Environment name used for tagging.')
param environment string = 'Lab'

@description('Cost center used for tagging.')
param costCenter string = 'AZ104'

@description('Management owner used for tagging.')
param managedBy string = 'Azure'

var commonTags = {
Project: projectName
Environment: environment
CostCenter: costCenter
ManagedBy: managedBy
}

resource coreRG 'Microsoft.Resources/resourceGroups@2025-04-01' = {
name: 'rg-az104-shamlifoods-core'
location: location
tags: commonTags
}

resource identityRG 'Microsoft.Resources/resourceGroups@2025-04-01' = {
name: 'rg-az104-shamlifoods-identity'
location: location
tags: commonTags
}

resource storageRG 'Microsoft.Resources/resourceGroups@2025-04-01' = {
name: 'rg-az104-shamlifoods-storage'
location: location
tags: commonTags
}

resource computeRG 'Microsoft.Resources/resourceGroups@2025-04-01' = {
name: 'rg-az104-shamlifoods-compute'
location: location
tags: commonTags
}

resource networkRG 'Microsoft.Resources/resourceGroups@2025-04-01' = {
name: 'rg-az104-shamlifoods-network'
location: location
tags: commonTags
}

resource monitorRG 'Microsoft.Resources/resourceGroups@2025-04-01' = {
name: 'rg-az104-shamlifoods-monitor'
location: location
tags: commonTags
}

output resourceGroups array = [
coreRG.name
identityRG.name
storageRG.name
computeRG.name
networkRG.name
monitorRG.name
]
