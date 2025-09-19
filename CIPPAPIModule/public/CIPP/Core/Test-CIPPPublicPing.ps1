<#
.SYNOPSIS
Tests connectivity to the CIPP API using the public ping endpoint.

.DESCRIPTION
The Test-CIPPPublicPing function tests connectivity to the CIPP API using the public ping endpoint. It uses the Invoke-CIPPRestMethod function to make a REST API call to the public ping endpoint, which returns system status information including cold start status and timestamp.

.EXAMPLE
Test-CIPPPublicPing
Tests connectivity to the CIPP API and returns system status information.
#>

function Test-CIPPPublicPing {
    [CmdletBinding()]
    Param()

    Write-Verbose "Testing CIPP API connectivity via public ping endpoint"
    $endpoint = '/api/PublicPing'

    Invoke-CIPPRestMethod -Endpoint $endpoint -Method 'GET'
}