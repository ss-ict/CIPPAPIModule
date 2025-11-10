# Get-CIPPEquipment
## SYNOPSIS
Retrieves equipment mailbox records for a given customer tenant.
## DESCRIPTION
Get-CIPPEquipment calls the CIPP API endpoint '/api/ListEquipment' to obtain equipment mailbox information for the specified CustomerTenantID. If an EquipmentID is provided, the results are filtered to that specific equipment; otherwise all equipment for the tenant are returned. The function relies on Invoke-CIPPRestMethod to perform the REST call and supports standard PowerShell common parameters such as -Verbose.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The tenant identifier used to filter equipment records. This parameter is mandatory.

  ## **-EquipmentID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional. When provided, restricts the returned results to the equipment item with this ID.

 #### EXAMPLE 1
```powershell
PS > # Retrieve all equipment for a tenant
```
 #### EXAMPLE 2
```powershell
PS > # Retrieve a specific equipment item for a tenant
```

