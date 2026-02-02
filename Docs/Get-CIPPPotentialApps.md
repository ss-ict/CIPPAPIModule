# Get-CIPPPotentialApps
## SYNOPSIS
Searches for available applications from WinGet or Chocolatey repositories.
## DESCRIPTION
The Get-CIPPPotentialApps function searches for available applications from WinGet or Chocolatey repositories. 
This is useful for finding applications that can be deployed through CIPP to managed endpoints.
# PARAMETERS

## **-Type**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the application repository type. Valid values are 'WinGet' and 'Choco'. This parameter is mandatory.

  ## **-SearchString**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the search term to find applications. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPPotentialApps -Type "WinGet" -SearchString "Chrome"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPPotentialApps -Type "Choco" -SearchString "Firefox"
```

