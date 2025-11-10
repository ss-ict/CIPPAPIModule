# Get-CIPPScheduledItemDetails
## SYNOPSIS
Retrieves detailed information about a scheduled item.
## DESCRIPTION
The Get-CIPPScheduledItemDetails function retrieves detailed information about a specific scheduled task in CIPP, 
including the task configuration, execution history, and results for each tenant.
# PARAMETERS

## **-RowKey**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the RowKey (ID) of the scheduled item. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPScheduledItemDetails -RowKey "12345678-1234-1234-1234-123456789012"
```

