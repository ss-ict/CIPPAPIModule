<#
.SYNOPSIS
Retrieves a quarantined email message from Exchange Online.

.DESCRIPTION
The Get-CIPPMailQuarantineMessage function retrieves a specific quarantined email message from Exchange Online 
and exports it in EML format. This allows you to view the full message content including headers and body.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.PARAMETER Identity
Specifies the identity (ID) of the quarantined message. This parameter is mandatory.

.EXAMPLE
Get-CIPPMailQuarantineMessage -CustomerTenantID "contoso.onmicrosoft.com" -Identity "c14401cf-aa9a-465b-cfd5-08d0f0d1993f\4c2ca98e-94ea-db3a-7eb8-3b63657d4db7"
Retrieves the specified quarantined message in EML format.

.NOTES
This function requires appropriate Exchange Online permissions through the CIPP API.
The message content is returned in EML format which can be saved and opened in email clients.
#>

function Get-CIPPMailQuarantineMessage {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$Identity
    )

    Write-Verbose "Retrieving quarantined message $Identity for tenant: $CustomerTenantID"
    
    $endpoint = '/api/ListMailQuarantineMessage'
    $params = @{
        tenantFilter = $CustomerTenantID
        Identity     = $Identity
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
