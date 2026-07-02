# Get-CIPPMailboxPermissions
## SYNOPSIS
Retrieves mailbox permissions for a specified customer tenant and user ID.
## DESCRIPTION
The Get-CIPPMailboxPermissions function retrieves mailbox permissions for a specified customer tenant and user ID. It makes an API call to the "/api/listmailboxpermissions" endpoint with the provided parameters.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which mailbox permissions are to be retrieved. This parameter is mandatory.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The ID of the user for which mailbox permissions are to be retrieved. Optional; omit to retrieve permissions for all mailboxes. Cannot be combined with -UseReportDB (the cached report only covers all mailboxes).

  ## **-UseReportDB**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
When specified, retrieves mailbox permissions from the CIPP report database cache instead of live Exchange Online data. The backend only serves cached data when no UserID is supplied. Use 'AllTenants' with this switch for cached cross-tenant data.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPMailboxPermissions -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "user1@domain.com"

This example retrieves mailbox permissions for the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" and the user with ID "user1@domain.com".
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPMailboxPermissions -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB

This example retrieves the cached mailbox permissions report for all mailboxes in the "contoso.onmicrosoft.com" tenant from the report database.
```

