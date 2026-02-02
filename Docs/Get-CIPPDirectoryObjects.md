# Get-CIPPDirectoryObjects
## SYNOPSIS
Retrieves directory objects by their IDs from Microsoft Graph.
## DESCRIPTION
The Get-CIPPDirectoryObjects function retrieves directory objects (users, groups, devices, etc.) by their IDs from Microsoft Graph. 
This is useful for batch lookups of multiple objects at once. You can optionally specify which properties to return.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-Ids**
> ![Foo](https://img.shields.io/badge/Type-String[]-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies an array of directory object IDs to retrieve. This parameter is mandatory.

  ## **-Select**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the properties to return for each directory object. This parameter is optional.  If not provided, all properties will be returned.

  ## **-AsApp**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to use application permissions instead of delegated permissions. This parameter is optional.

  ## **-PartnerLookup**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to perform a lookup in the partner tenant. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPDirectoryObjects -CustomerTenantID "contoso.onmicrosoft.com" -Ids @("12345678-1234-1234-1234-123456789012", "87654321-4321-4321-4321-210987654321")
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPDirectoryObjects -CustomerTenantID "contoso.onmicrosoft.com" -Ids @("12345678-1234-1234-1234-123456789012") -Select "displayName,userPrincipalName"
```

