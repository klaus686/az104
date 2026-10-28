targetScope = 'subscription'

@description('Object ID of the AZ104-Administrators Entra security group.')
param administratorsGroupObjectId string

@description('Object ID of the AZ104-Developers Entra security group.')
param developersGroupObjectId string

@description('Object ID of the AZ104-Operations Entra security group.')
param operationsGroupObjectId string

@description('Object ID of the AZ104-Readers Entra security group.')
param readersGroupObjectId string

var coreScope = resourceId(
'Microsoft.Resources/resourceGroups',
'rg-az104-shamlifoods-core'
)

var computeScope = resourceId(
'Microsoft.Resources/resourceGroups',
'rg-az104-shamlifoods-compute'
)

var storageScope = resourceId(
'Microsoft.Resources/resourceGroups',
'rg-az104-shamlifoods-storage'
)

var monitorScope = resourceId(
'Microsoft.Resources/resourceGroups',
'rg-az104-shamlifoods-monitor'
)

// ------------------------------------------------------------
// RBAC
// ------------------------------------------------------------

resource administratorsRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
name: guid(coreScope, administratorsGroupObjectId, 'Contributor')
scope: coreScope
properties: {
roleDefinitionId: subscriptionResourceId(
'Microsoft.Authorization/roleDefinitions',
'b24988ac-6180-42a0-ab88-20f7382dd24c'
)
principalId: administratorsGroupObjectId
principalType: 'Group'
}
}

resource developersRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
name: guid(computeScope, developersGroupObjectId, 'Contributor')
scope: computeScope
properties: {
roleDefinitionId: subscriptionResourceId(
'Microsoft.Authorization/roleDefinitions',
'b24988ac-6180-42a0-ab88-20f7382dd24c'
)
principalId: developersGroupObjectId
principalType: 'Group'
}
}

resource operationsRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
name: guid(storageScope, operationsGroupObjectId, 'Contributor')
scope: storageScope
properties: {
roleDefinitionId: subscriptionResourceId(
'Microsoft.Authorization/roleDefinitions',
'b24988ac-6180-42a0-ab88-20f7382dd24c'
)
principalId: operationsGroupObjectId
principalType: 'Group'
}
}

resource readersRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
name: guid(monitorScope, readersGroupObjectId, 'Reader')
scope: monitorScope
properties: {
roleDefinitionId: subscriptionResourceId(
'Microsoft.Authorization/roleDefinitions',
'acdd72a7-3385-48ef-bd42-f606fba81ae7'
)
principalId: readersGroupObjectId
principalType: 'Group'
}
}

// ------------------------------------------------------------
// Resource lock
// ------------------------------------------------------------

resource coreDeleteLock 'Microsoft.Authorization/locks@2020-05-01' = {
name: 'AZ104-Core-CannotDelete'
scope: coreScope
properties: {
level: 'CanNotDelete'
notes: 'Protects the AZ-104 ShamliFoods core resource group from accidental deletion.'
}
}

output coreResourceGroupScope string = coreScope
output computeResourceGroupScope string = computeScope
output storageResourceGroupScope string = storageScope
output monitorResourceGroupScope string = monitorScope
