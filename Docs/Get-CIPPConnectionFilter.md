# Get-CIPPConnectionFilter
## SYNOPSIS
Retrieves connection filter policies from Exchange Online.
## DESCRIPTION
The Get-CIPPConnectionFilter function retrieves hosted connection filter policies from Exchange Online for a specified tenant. 
Connection filters are used to control which IP addresses can connect to your organization.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPConnectionFilter -CustomerTenantID "contoso.onmicrosoft.com"
```

