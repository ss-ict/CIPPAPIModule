# Get-CIPPExtensionCacheData
## SYNOPSIS
Retrieves extension cache data from CIPP.
## DESCRIPTION
The Get-CIPPExtensionCacheData function retrieves cached data from CIPP extensions for a specified tenant. 
This data is synchronized from external systems (like PSA/RMM tools) and cached in CIPP for faster access.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-DataTypes**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-All-Blue?color=5547a8)\
Specifies which data types to retrieve from the cache. This parameter is optional.  If not provided, all cached data types will be returned. Multiple data types can be specified as a comma-separated string. Valid data types include: - Overview sync: TenantDetails, AllRoles, Domains, Licenses, ConditionalAccess, SecureScoreControlProfiles, Subscriptions, OneDriveUsage, MailboxUsage, SecureScore - Users sync: Users - Groups sync: Groups - Devices sync: Devices, DeviceCompliancePolicies, DeviceApps - Mailboxes sync: Mailboxes, CASMailbox

 #### EXAMPLE 1
```powershell
PS > Get-CIPPExtensionCacheData -CustomerTenantID "contoso.onmicrosoft.com"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPExtensionCacheData -CustomerTenantID "contoso.onmicrosoft.com" -DataTypes "TenantDetails,Licenses"
```
 #### EXAMPLE 3
```powershell
PS > Get-CIPPExtensionCacheData -CustomerTenantID "contoso.onmicrosoft.com" -DataTypes "Users,Groups,Devices"
```

