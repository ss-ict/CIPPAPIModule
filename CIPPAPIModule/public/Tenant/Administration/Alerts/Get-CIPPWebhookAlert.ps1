<#
.SYNOPSIS
Retrieves webhook alert configurations from CIPP.

.DESCRIPTION
The Get-CIPPWebhookAlert function retrieves configured webhook alert settings from CIPP. 
Webhook alerts allow CIPP to send notifications to external systems when specific events occur.

.EXAMPLE
Get-CIPPWebhookAlert
Retrieves all webhook alert configurations.

.NOTES
This function retrieves webhook alert configurations from the SchedulerConfig table.
Each webhook includes conditions (If) and execution actions that are stored as JSON and parsed automatically.
#>

function Get-CIPPWebhookAlert {
    [CmdletBinding()]
    param ()

    Write-Verbose "Retrieving webhook alert configurations"
    
    $endpoint = '/api/ListWebhookAlert'

    Invoke-CIPPRestMethod -Endpoint $endpoint
}
