# Get-CIPPSafeLinksPolicyTemplates
## SYNOPSIS
Retrieves Safe Links policy templates from CIPP.
## DESCRIPTION
The Get-CIPPSafeLinksPolicyTemplates function retrieves Safe Links policy templates stored in CIPP. 
These templates can be used to create Safe Links policies in Microsoft Defender for Office 365.
# PARAMETERS

## **-ID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of a specific Safe Links policy template to retrieve. This parameter is optional.  If not provided, all Safe Links policy templates will be retrieved.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPSafeLinksPolicyTemplates
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPSafeLinksPolicyTemplates -ID "StandardProtection.SafeLinksTemplate.json"
```

