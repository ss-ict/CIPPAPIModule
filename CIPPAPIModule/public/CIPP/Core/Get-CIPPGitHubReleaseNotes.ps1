<#
.SYNOPSIS
Retrieves release notes from a GitHub repository.

.DESCRIPTION
The Get-CIPPGitHubReleaseNotes function retrieves release notes and metadata for a specified GitHub repository. 
The function caches results for 24 hours to improve performance. Hotfix versions (e.g., v8.5.2) map back to the base release tag (v8.5.0).

.PARAMETER Owner
Specifies the GitHub repository owner (username or organization). This parameter is mandatory.

.PARAMETER Repository
Specifies the GitHub repository name. This parameter is mandatory.

.EXAMPLE
Get-CIPPGitHubReleaseNotes -Owner "KelvinTegelaar" -Repository "CIPP"
Retrieves release notes for the CIPP repository.

.EXAMPLE
Get-CIPPGitHubReleaseNotes -Owner "microsoft" -Repository "365-management"
Retrieves release notes for the Microsoft 365 management repository.

.NOTES
Release information is cached for 24 hours. The function returns up to 50 releases.
#>

function Get-CIPPGitHubReleaseNotes {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$Owner = 'KelvinTegelaar',
        [Parameter(Mandatory = $false)]
        [string]$Repository = 'CIPP'
    )

    Write-Verbose "Retrieving GitHub release notes for $Owner/$Repository"
    
    $endpoint = '/api/ListGitHubReleaseNotes'
    $params = @{
        Owner      = $Owner
        Repository = $Repository
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
