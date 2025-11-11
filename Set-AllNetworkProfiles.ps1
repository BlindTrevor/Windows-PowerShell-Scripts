function Set-AllNetworkProfiles {
    [CmdletBinding()]
    param(
        [ValidateSet("Private","Public")]
        [string]$NetworkCategory = "Private"
    )

    # Get all network connection profiles
    $profiles = Get-NetConnectionProfile

    foreach ($profile in $profiles) {
        Write-Host "Changing $($profile.InterfaceAlias) from $($profile.NetworkCategory) to $NetworkCategory"
        Set-NetConnectionProfile -InterfaceAlias $profile.InterfaceAlias -NetworkCategory $NetworkCategory
    }

    # Show updated profiles
    Get-NetConnectionProfile | Format-Table Name, InterfaceAlias, NetworkCategory
}


# Set-AllNetworkProfiles -NetworkCategory Private
# Set-AllNetworkProfiles -NetworkCategory Public
