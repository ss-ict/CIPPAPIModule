<#
.SYNOPSIS
Retrieves Best Practice Analyser results for customer tenants.

.DESCRIPTION
The Get-CIPPBestPracticeAnalyser function retrieves Best Practice Analyser (BPA) results for customer tenants. It uses the Invoke-CIPPRestMethod function to make a REST API call to retrieve cached BPA results from the system.

.EXAMPLE
Get-CIPPBestPracticeAnalyser
Retrieves all Best Practice Analyser results for all customer tenants.
#>

function Get-CIPPBestPracticeAnalyser {
    [CmdletBinding()]
    Param()

    Write-Verbose "Getting Best Practice Analyser results"
    $endpoint = '/api/BestPracticeAnalyser_List'

    Invoke-CIPPRestMethod -Endpoint $endpoint -Method 'GET'
}