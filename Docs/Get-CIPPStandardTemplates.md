# Get-CIPPStandardTemplates
## SYNOPSIS
Retrieves standard templates from CIPP.
## DESCRIPTION
The Get-CIPPStandardTemplates function retrieves saved standard templates from CIPP. 
Standard templates define collections of best practices and configurations that can be applied to tenants.
# PARAMETERS

## **-ID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the GUID of a specific standard template to retrieve. This parameter is optional.  If not provided, all standard templates will be retrieved.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPStandardTemplates
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPStandardTemplates -ID "12345678-1234-1234-1234-123456789012"
```

