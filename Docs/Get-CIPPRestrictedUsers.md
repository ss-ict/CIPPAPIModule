# Get-CIPPRestrictedUsers
## SYNOPSIS
Retrieves restricted users from Exchange Online.
## DESCRIPTION
The Get-CIPPRestrictedUsers function retrieves users from the restricted senders list in Exchange Online. 
These are users who have been blocked from sending email due to exceeding sending limits or other restrictions.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPRestrictedUsers -CustomerTenantID "contoso.onmicrosoft.com"
```

