<#
.SYNOPSIS
Retrieves extension cache data from CIPP.

.DESCRIPTION
The Get-CIPPExtensionCacheData function retrieves cached data from CIPP extensions for a specified tenant. 
This data is synchronized from external systems (like PSA/RMM tools) and cached in CIPP for faster access.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.PARAMETER DataTypes
Specifies which data types to retrieve from the cache. This parameter is optional. 
If not provided, all cached data types will be returned. Multiple data types can be specified as a comma-separated string.
Valid data types include:
- Overview sync: TenantDetails, AllRoles, Domains, Licenses, ConditionalAccess, SecureScoreControlProfiles, Subscriptions, OneDriveUsage, MailboxUsage, SecureScore
- Users sync: Users
- Groups sync: Groups
- Devices sync: Devices, DeviceCompliancePolicies, DeviceApps
- Mailboxes sync: Mailboxes, CASMailbox

.EXAMPLE
Get-CIPPExtensionCacheData -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves all extension cache data for the specified tenant.

.EXAMPLE
Get-CIPPExtensionCacheData -CustomerTenantID "contoso.onmicrosoft.com" -DataTypes "TenantDetails,Licenses"
Retrieves specific extension cache data types for the specified tenant.

.EXAMPLE
Get-CIPPExtensionCacheData -CustomerTenantID "contoso.onmicrosoft.com" -DataTypes "Users,Groups,Devices"
Retrieves user, group, and device data from the extension cache.

.NOTES
This function is used to access cached data from integrated extensions without making direct API calls to external systems.
The cache is populated by the Sync-CippExtensionData function which runs on a schedule.
Data types correspond to the sync operations: Overview, Users, Groups, Devices, and Mailboxes.
#>

function Get-CIPPExtensionCacheData {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [ValidateSet(
            'All',
            'TenantDetails',
            'AllRoles',
            'Domains',
            'Licenses',
            'ConditionalAccess',
            'SecureScoreControlProfiles',
            'Subscriptions',
            'OneDriveUsage',
            'MailboxUsage',
            'SecureScore',
            'Users',
            'Groups',
            'Devices',
            'DeviceCompliancePolicies',
            'DeviceApps',
            'Mailboxes',
            'CASMailbox'
        )]
        [string]$DataTypes = 'All'
    )

    Write-Verbose "Retrieving extension cache data for tenant: $CustomerTenantID"
    
    $endpoint = '/api/ListExtensionCacheData'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    
    if ($DataTypes) {
        $params.dataTypes = $DataTypes
        Write-Verbose "Retrieving data types: $DataTypes"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
