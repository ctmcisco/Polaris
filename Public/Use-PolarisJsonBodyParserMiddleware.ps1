# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

<#
.SYNOPSIS
    Helper function that turns on the Json Body parsing middleware.
.DESCRIPTION
    Helper function that turns on the Json Body parsing middleware.
.PARAMETER Polaris
    A Polaris object
    Defaults to the script scoped Polaris
.EXAMPLE
    Use-PolarisJsonBodyParserMiddleware
#>
function Use-PolarisJsonBodyParserMiddleware {
    [CmdletBinding()]
    param(
        $Polaris
    )

    New-PolarisRouteMiddleware -Name JsonBodyParser -Scriptblock {
        if ( $Null -ne $Request.BodyString ) {
            $Request.Body = $Request.BodyString | ConvertFrom-Json
        }
    } -Force -Polaris $Polaris
}
