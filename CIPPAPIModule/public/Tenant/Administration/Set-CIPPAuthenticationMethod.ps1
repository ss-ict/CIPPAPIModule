<#
.SYNOPSIS
Sets the state of an authentication method for a tenant.

.DESCRIPTION
The Set-CIPPAuthenticationMethod function enables or disables a specific authentication method for a tenant in Azure AD. 
This allows you to control which authentication methods (SMS, Voice, Email OTP, etc.) are available to users.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.PARAMETER AuthenticationMethodId
Specifies the ID of the authentication method to configure. This parameter is mandatory.
Valid authentication methods:
- FIDO2: FIDO2 security keys
- MicrosoftAuthenticator: Microsoft Authenticator app
- SMS: Text message authentication
- TemporaryAccessPass: Temporary access pass
- HardwareOATH: Hardware OATH tokens (Preview)
- softwareOath: Third-party software OATH tokens
- Voice: Voice call authentication
- Email: Email OTP authentication
- x509Certificate: Certificate-based authentication
- QRCodePin: QR code authentication

.PARAMETER State
Specifies whether to enable or disable the authentication method. Valid values are 'enabled' and 'disabled'. This parameter is mandatory.

.EXAMPLE
Set-CIPPAuthenticationMethod -CustomerTenantID "contoso.onmicrosoft.com" -AuthenticationMethodId "SMS" -State "disabled"
Disables SMS authentication for the specified tenant.

.EXAMPLE
Set-CIPPAuthenticationMethod -CustomerTenantID "contoso.onmicrosoft.com" -AuthenticationMethodId "FIDO2" -State "enabled"
Enables FIDO2 security key authentication for the specified tenant.

.EXAMPLE
Set-CIPPAuthenticationMethod -CustomerTenantID "contoso.onmicrosoft.com" -AuthenticationMethodId "MicrosoftAuthenticator" -State "enabled"
Enables Microsoft Authenticator app authentication for the specified tenant.

.NOTES
This function modifies tenant-wide authentication policy settings.
Changes may take a few minutes to propagate to all users.
Note: Some authentication methods like SMS, Voice, Email, and QRCodePin can only be disabled, not enabled through this function.
Authentication method IDs are case-sensitive.
#>

function Set-CIPPAuthenticationMethod {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [ValidateSet(
            'FIDO2',
            'MicrosoftAuthenticator',
            'SMS',
            'TemporaryAccessPass',
            'HardwareOATH',
            'softwareOath',
            'Voice',
            'Email',
            'x509Certificate',
            'QRCodePin'
        )]
        [string]$AuthenticationMethodId,
        [Parameter(Mandatory = $true)]
        [ValidateSet('enabled', 'disabled')]
        [string]$State
    )

    if ($PSCmdlet.ShouldProcess("$AuthenticationMethodId in tenant $CustomerTenantID", "Set authentication method to $State")) {
        Write-Verbose "Setting authentication method $AuthenticationMethodId to $State for tenant: $CustomerTenantID"
        
        $endpoint = '/api/SetAuthMethod'
        $body = @{
            tenantFilter = $CustomerTenantID
            Id           = $AuthenticationMethodId
            state        = $State
        }

        Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
    }
}
