<#
.SYNOPSIS
Starts the Domain Analyser process for CIPP.

.DESCRIPTION
The Start-CIPPDomainAnalyser function starts the Domain Analyser process for CIPP. It uses the Invoke-CIPPRestMethod function to make a REST API call to initiate domain analysis across customer tenants.

.EXAMPLE
Start-CIPPDomainAnalyser
Starts the Domain Analyser process.
#>

function Start-CIPPDomainAnalyser {
    [CmdletBinding()]
    Param()

    Write-Verbose "Starting Domain Analyser process"
    $endpoint = '/api/ExecDomainAnalyser'

    Invoke-CIPPRestMethod -Endpoint $endpoint -Method 'GET'
}