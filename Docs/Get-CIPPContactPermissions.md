# Get-CIPPContactPermissions
## SYNOPSIS
Retrieves contact folder permissions for a mailbox.
## DESCRIPTION
The Get-CIPPContactPermissions function retrieves contact folder permissions for a specified mailbox in Exchange Online. 
This includes information about who has access to the contact folder and their permission levels.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the user ID (UPN or email address) of the mailbox owner. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPContactPermissions -CustomerTenantID "contoso.onmicrosoft.com" -UserID "john.doe@contoso.com"
```

