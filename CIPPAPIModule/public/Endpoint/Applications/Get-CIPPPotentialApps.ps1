<#
.SYNOPSIS
Searches for available applications from WinGet or Chocolatey repositories.

.DESCRIPTION
The Get-CIPPPotentialApps function searches for available applications from WinGet or Chocolatey repositories. 
This is useful for finding applications that can be deployed through CIPP to managed endpoints.

.PARAMETER Type
Specifies the application repository type. Valid values are 'WinGet' and 'Choco'. This parameter is mandatory.

.PARAMETER SearchString
Specifies the search term to find applications. This parameter is mandatory.

.EXAMPLE
Get-CIPPPotentialApps -Type "WinGet" -SearchString "Chrome"
Searches for Chrome in the WinGet repository.

.EXAMPLE
Get-CIPPPotentialApps -Type "Choco" -SearchString "Firefox"
Searches for Firefox in the Chocolatey repository.

.NOTES
This function queries public repositories and does not require a tenant filter.
WinGet searches return up to 50 results from the Microsoft Store Edge repository.
Chocolatey searches return up to 999 results from the Chocolatey community repository.
#>

function Get-CIPPPotentialApps {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateSet('WinGet', 'Choco')]
        [string]$Type,
        [Parameter(Mandatory = $true)]
        [string]$SearchString
    )

    Write-Verbose "Searching for applications in $Type repository: $SearchString"
    
    $endpoint = '/api/ListPotentialApps'
    $body = @{
        type         = $Type
        SearchString = $SearchString
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
