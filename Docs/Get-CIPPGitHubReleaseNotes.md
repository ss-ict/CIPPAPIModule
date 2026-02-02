# Get-CIPPGitHubReleaseNotes
## SYNOPSIS
Retrieves release notes from a GitHub repository.
## DESCRIPTION
The Get-CIPPGitHubReleaseNotes function retrieves release notes and metadata for a specified GitHub repository. 
The function caches results for 24 hours to improve performance. Hotfix versions (e.g., v8.5.2) map back to the base release tag (v8.5.0).
# PARAMETERS

## **-Owner**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-KelvinTegelaar-Blue?color=5547a8)\
Specifies the GitHub repository owner (username or organization). This parameter is mandatory.

  ## **-Repository**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-CIPP-Blue?color=5547a8)\
Specifies the GitHub repository name. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPGitHubReleaseNotes -Owner "KelvinTegelaar" -Repository "CIPP"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPGitHubReleaseNotes -Owner "microsoft" -Repository "365-management"
```

