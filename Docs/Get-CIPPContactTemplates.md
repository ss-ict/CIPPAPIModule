# Get-CIPPContactTemplates
## SYNOPSIS
Retrieves contact templates from CIPP.
## DESCRIPTION
The Get-CIPPContactTemplates function retrieves contact templates stored in CIPP. 
You can retrieve all templates or a specific template by providing its ID.
# PARAMETERS

## **-ID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of a specific contact template to retrieve. This parameter is optional.  If not provided, all contact templates will be retrieved.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPContactTemplates
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPContactTemplates -ID "template123.ContactTemplate.json"
```

