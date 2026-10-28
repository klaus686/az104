# Module 02 — Storage

## Project

AZ-104 ShamliFoods

## Objective

Implement and validate Azure Storage services required for the AZ-104 administrator project.

The module demonstrates storage account configuration, Blob Storage, Azure Files, security, access control, data protection, lifecycle management, replication, networking, storage tools, and automation.

---

## Azure Resources

### Primary Storage Account

`staz104shamlifoods01`

Purpose:

* Primary application/customer data
* Blob Storage
* Azure Files
* Storage protection and lifecycle testing

### Secondary Storage Account

`staz104shamlifoods02`

Purpose:

* Blob object replication destination
* Disaster-recovery/data-replication demonstration

### Blob Containers

* `customer-data`
* `customer-data-replica`
* `blob-inventory`
* Azure system containers created automatically

### Azure File Share

`customer-files`

---

## Storage Account Configuration

The primary storage account was configured with:

* StorageV2
* Standard performance
* Locally redundant storage (LRS)
* Hot access tier
* HTTPS-only traffic
* TLS 1.2 minimum
* Anonymous blob access disabled
* Microsoft Entra authorization enabled in the Azure portal
* Shared key access enabled
* Public network access enabled for the lab
* Microsoft network routing
* Microsoft-managed encryption keys

---

## Blob Storage

The project includes:

* Private blob container
* Blob upload/download
* Blob metadata
* Blob access testing
* Hot and Cool access tiers
* Blob versioning
* Blob soft delete
* Container soft delete
* Change feed
* Lifecycle management
* Blob inventory
* Object replication
* Storage Browser access

---

## Blob Metadata Test

Test blob:

`shamlifoods-test.txt`

Metadata:

```text
project     = AZ104-ShamliFoods
environment = lab
dataType    = test
owner       = shamlifoods
```

---

## Access Control

Microsoft Entra/RBAC data-plane authorization was tested.

The following role was assigned at storage-account scope for Blob access:

**Storage Blob Data Contributor**

This demonstrated the difference between Azure management-plane permissions and storage data-plane permissions.

---

## SAS Testing

SAS functionality was investigated using a stored access policy.

The lab encountered authentication/signature errors during SAS testing. The troubleshooting process was documented rather than hiding the failed test.

No SAS token or secret is stored in this repository.

---

## Blob Access Tiers

The test blob was moved between:

```text
Hot → Cool → Hot
```

This demonstrated access-tier management.

---

## Lifecycle Management

Lifecycle rule:

`customer-data-lifecycle`

Configured actions:

| Condition | Action          |
| --------- | --------------- |
| 30 days   | Move to Cool    |
| 90 days   | Move to Cold    |
| 180 days  | Move to Archive |
| 365 days  | Delete          |

The lifecycle policy targets block blobs in the customer-data workload.

---

## Data Protection

Configured and tested:

* Blob versioning
* Blob soft delete
* Container soft delete
* Change feed
* Azure Files share snapshots

Retention used in the lab:

**7 days**

---

## Blob Versioning Test

A blob was overwritten multiple times.

Multiple versions were verified in the portal.

This demonstrated how previous versions can be retained after an overwrite.

---

## Blob Soft Delete Test

The test blob was deleted.

The deleted blob was located using the portal's deleted-object filter.

Because versioning was enabled, restoration was performed using a previous blob version.

---

## Container Soft Delete Test

A temporary container was:

1. Created
2. Deleted
3. Located using the deleted-container view
4. Restored

This demonstrated container-level soft delete.

---

## Azure Files

Azure Files share:

`customer-files`

Configuration/testing included:

* SMB
* Transaction optimized access tier
* Share-level access permissions
* Microsoft Entra Kerberos
* Azure Files snapshots
* Windows SMB connectivity testing

### SMB Network Limitation

Windows SMB connectivity to:

`staz104shamlifoods01.file.core.windows.net`

was tested on TCP port 445.

The test returned:

```text
TcpTestSucceeded : False
```

The issue was documented as a network-path/port limitation rather than incorrectly changing the storage security configuration.

---

## Azure Files Snapshots

Two snapshots were created and verified.

Purpose:

Demonstrate point-in-time protection for an Azure file share.

---

## Object Replication

Source:

`staz104shamlifoods01`

Source container:

`customer-data`

Destination:

`staz104shamlifoods02`

Destination container:

`customer-data-replica`

A test blob was uploaded to the source and successfully appeared in the destination.

---

## Blob Inventory

Inventory rule:

`customer-data-inventory`

Configuration included:

* Daily frequency
* CSV output
* Block blobs
* Blob name
* Creation time
* Last modified
* Content length
* Blob type
* Access tier
* Metadata
* ETag

---

## Storage Networking

The storage account uses:

* Public network access enabled
* All networks
* Microsoft network routing

Anonymous blob access was separately tested and denied because the container is private.

This demonstrates that:

**Public network access ≠ anonymous data access.**

---

## Storage Browser

Azure Portal Storage Browser was used to authenticate and access the private blob.

This demonstrated authenticated data-plane access without making the container public.

---

## Automation

Automation files are provided for:

### Azure CLI

`cli/storage.sh`

### Azure PowerShell

`powershell/storage.ps1`

### Bicep

`bicep/storage-account.bicep`

The automation files are intended for repeatable deployment/validation and are not automatically executed against the existing lab resources.

---

## Security

Secrets are deliberately excluded from this repository.

Never commit:

* Storage account keys
* SAS tokens
* Connection strings
* Passwords
* Private keys
* Client secrets

---

## AZ-104 Concepts Demonstrated

This module demonstrates:

* Storage accounts
* Storage redundancy
* Blob containers
* Blob access
* Blob metadata
* Storage access tiers
* Lifecycle management
* Blob versioning
* Blob soft delete
* Container soft delete
* Change feed
* Azure Files
* SMB
* Microsoft Entra Kerberos
* File share snapshots
* Object replication
* Blob inventory
* Storage networking
* RBAC data-plane authorization
* Storage Browser
* Azure CLI
* Azure PowerShell
* Bicep
* Storage troubleshooting

---

## Lessons Learned

### Management plane vs data plane

Having administrative permissions on the Azure resource does not automatically mean the same identity can perform every storage data operation.

Storage data-plane RBAC roles may be required.

### Public endpoint vs public data

A storage account can have public network access enabled while the actual blob container remains private.

### Versioning and soft delete

When versioning is enabled, restoring deleted/overwritten blob content may require working with previous versions rather than treating the operation like a simple undelete.

### Azure Files SMB

Successful Azure Files configuration does not guarantee that TCP 445 is reachable from every client network.

---

## Cleanup

Resources created specifically for testing should be removed when no longer required.

Do not delete the primary storage account or storage resources required by the integrated AZ-104 project until the project is complete.

Automation should be reviewed before execution.
