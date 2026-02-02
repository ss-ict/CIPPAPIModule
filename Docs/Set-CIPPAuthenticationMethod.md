# Set-CIPPAuthenticationMethod
## SYNOPSIS
Sets the state of an authentication method for a tenant.
## DESCRIPTION
The Set-CIPPAuthenticationMethod function enables or disables a specific authentication method for a tenant in Azure AD. 
This allows you to control which authentication methods (SMS, Voice, Email OTP, etc.) are available to users.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-AuthenticationMethodId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the authentication method to configure. This parameter is mandatory. Valid authentication methods: - FIDO2: FIDO2 security keys - MicrosoftAuthenticator: Microsoft Authenticator app - SMS: Text message authentication - TemporaryAccessPass: Temporary access pass - HardwareOATH: Hardware OATH tokens (Preview) - softwareOath: Third-party software OATH tokens - Voice: Voice call authentication - Email: Email OTP authentication - x509Certificate: Certificate-based authentication - QRCodePin: QR code authentication

  ## **-State**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies whether to enable or disable the authentication method. Valid values are 'enabled' and 'disabled'. This parameter is mandatory.

  ## **-WhatIf**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


  ## **-Confirm**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


 #### EXAMPLE 1
```powershell
PS > Set-CIPPAuthenticationMethod -CustomerTenantID "contoso.onmicrosoft.com" -AuthenticationMethodId "SMS" -State "disabled"
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPAuthenticationMethod -CustomerTenantID "contoso.onmicrosoft.com" -AuthenticationMethodId "FIDO2" -State "enabled"
```
 #### EXAMPLE 3
```powershell
PS > Set-CIPPAuthenticationMethod -CustomerTenantID "contoso.onmicrosoft.com" -AuthenticationMethodId "MicrosoftAuthenticator" -State "enabled"
```

