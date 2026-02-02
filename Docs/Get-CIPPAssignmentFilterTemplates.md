# Get-CIPPAssignmentFilterTemplates
## SYNOPSIS
Retrieves assignment filter templates from CIPP.
## DESCRIPTION
The Get-CIPPAssignmentFilterTemplates function retrieves assignment filter templates stored in CIPP. 
These templates can be used to create assignment filters in Microsoft Endpoint Manager.
# PARAMETERS

## **-ID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID (GUID) of a specific assignment filter template to retrieve. This parameter is optional.  If not provided, all assignment filter templates will be retrieved.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPAssignmentFilterTemplates
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPAssignmentFilterTemplates -ID "12345678-1234-1234-1234-123456789012"
```

