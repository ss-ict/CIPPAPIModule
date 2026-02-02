<#
.SYNOPSIS
Tests connectivity to the CIPP API using the public ping endpoint.

.DESCRIPTION
This function sends a GET request to the CIPP public ping endpoint to prevent cold starts and verify API availability.

.PARAMETER CIPPPublicURL
The base URL for the GUI of the CIPP instance (e.g., 'https://cipp.domain.com'). No trailing slash.

.EXAMPLE
Test-CIPPPublicPing -CIPPPublicURL 'https://cipp.domain.com'
Tests connectivity to the CIPP API at the specified public URL.

.NOTES
This function does not require authentication to the CIPP API.
#>

function Test-CIPPPublicPing {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CIPPPublicURL
    )

    Write-Verbose 'Testing CIPP API connectivity via public ping endpoint'
    $endpoint = $CIPPPublicURL.TrimEnd('/') + '/api/PublicPing'

    Invoke-WebRequest -Uri $endpoint -Method GET
}