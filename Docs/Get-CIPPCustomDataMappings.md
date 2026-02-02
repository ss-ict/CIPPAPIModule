# Get-CIPPCustomDataMappings
## SYNOPSIS
Retrieves custom data mappings from CIPP.
## DESCRIPTION
The Get-CIPPCustomDataMappings function retrieves custom data mappings configured in CIPP. 
These mappings define how data from extensions is synchronized to directory objects. 
You can filter results by tenant, source type, and directory object type.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of the customer tenant to filter mappings. This parameter is optional.

  ## **-SourceType**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the source type to filter mappings (e.g., "Extension", "Manual"). This parameter is optional.

  ## **-DirectoryObject**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the directory object type to filter mappings (e.g., "User", "Group", "Device"). This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPCustomDataMappings
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPCustomDataMappings -CustomerTenantID "contoso.onmicrosoft.com"
```
 #### EXAMPLE 3
```powershell
PS > Get-CIPPCustomDataMappings -SourceType "Extension" -DirectoryObject "User"
```

