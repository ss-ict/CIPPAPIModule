# Get-CIPPGraphExplorerPresets
## SYNOPSIS
Retrieves Graph Explorer presets from CIPP.
## DESCRIPTION
The Get-CIPPGraphExplorerPresets function retrieves saved Graph Explorer presets from CIPP. 
Presets are saved Graph API queries that can be shared or kept private. You can optionally filter presets by endpoint.
# PARAMETERS

## **-Endpoint**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies an endpoint to filter the presets. This parameter is optional.  If provided, only presets matching the specified endpoint will be returned.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPGraphExplorerPresets
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPGraphExplorerPresets -Endpoint "/users"
```

