# Get-CIPPMailboxes
## SYNOPSIS
Retrieves a list of mailboxes for a specified customer tenant ID.
## DESCRIPTION
The Get-CIPPMailboxes function retrieves a list of mailboxes for a specified customer tenant ID. It can also include soft-deleted mailboxes if the -SoftDeletedMailboxes switch is used.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID for which to retrieve the mailbox list.

  ## **-SoftDeletedMailboxes**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Indicates whether to include soft-deleted mailboxes in the result. By default, this parameter is set to $false.

  ## **-UseReportDB**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
When specified, retrieves the mailbox list from the CIPP report database cache instead of live Exchange Online data. Use 'AllTenants' with this switch for cached cross-tenant data.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPMailboxes -CustomerTenantID "contoso.onmicrosoft.com"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPMailboxes -CustomerTenantID "contoso.onmicrosoft.com" -SoftDeletedMailboxes
```
 #### EXAMPLE 3
```powershell
PS > Get-CIPPMailboxes -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB
```

